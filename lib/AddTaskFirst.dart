import 'dart:async';
import 'package:flutter_app/SelectTask.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'AddTaskFormPage.dart';
import 'package:latlong/latlong.dart';


class AddTaskPage extends StatefulWidget {

  AddTaskPage({Key key, this.value, this.taskColor, this.selectedUser}) : super(key: key);
  final  String value;
  final Color taskColor;
  final List<UserDetails> selectedUser;
  final LatLng position;
  @override
  AddTaskPageState createState() => new AddTaskPageState();
}

class AddTaskPageState extends State<AddTaskPage> {
  TextEditingController controller = new TextEditingController();

  final clickedUsers = new Set<int>();

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(UserDetails.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('Add Agents'),
        centerTitle: true,
        backgroundColor: Color(0xFF25C27A),
      ),

      bottomNavigationBar:              Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
        elevation: 0.0,
        child: MaterialButton(
          onPressed: () {

                 List<UserDetails> temp = [];
                 for( var index in clickedUsers){
                   for (var i in _userDetails){
                     if (index == i.id){
                       temp.add(i);
                       break;
                     }
                   }
                 }
                 clickedUsers.clear();

                 var route = new MaterialPageRoute(
                   builder: (BuildContext context) =>
                   new AddTaskFormPage(selectedUser: temp, value: widget.value, taskColor: widget.taskColor,position: widget.position),
                 );
                 Navigator.of(context).push(route);
          },
          //height: 48,
          height: 48.0,
          color: Color(0xFF25C27A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Assign', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
              Icon(Icons.account_circle, color: Colors.white,),
              //Image(image: AssetImage('assets/right.png'), height: 15.0,)
            ],
          ),
        ),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 48.0,
            color: Colors.white,
            child: ListTile(
                  leading: new Icon(Icons.search, color: Color(0xFF404041),),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: 'Filter', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: _searchResult.length > 0 ? new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },) : null,
                ),


          ),
          Container(
            height: 1.0,
            color: Color(0xDEDEDE),
          ),
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, i) {
                final _isAlreadySaved = clickedUsers.contains(_searchResult[i].id);
                return new Card(
                  child: new ListTile(
                    leading: new Icon(Icons.check, color: !_isAlreadySaved ? Colors.white : Color(0xFF25C27A),),
                    title: new Text(_searchResult[i].firstName + ' ' + _searchResult[i].lastName),
                    trailing: new CircleAvatar(backgroundImage: new NetworkImage(_searchResult[i].profileUrl,),),
                    onTap: (){
                      setState(() {
                        _isAlreadySaved ? clickedUsers.remove(_searchResult[i].id) : clickedUsers.add(_searchResult[i].id);
                      });
                    },
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            )
                : new ListView.builder(
              itemCount: _userDetails.length,
              itemBuilder: (context, index) {
                print("cccc");
                bool _isAlreadySaved = false;
                if (_userDetails.isEmpty){
                  _isAlreadySaved = false;
                }
                else{
                  _isAlreadySaved = clickedUsers.contains(_userDetails[index].id);
                }

                return new Card(
                  child: new ListTile(
                    leading: new Icon(Icons.check, color: !_isAlreadySaved ? Colors.white : Color(0xFF25C27A),),
                    title: new Text(_userDetails[index].firstName + ' ' + _userDetails[index].lastName),
                    trailing: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
                    onTap: (){
                      setState(() {
                        print(_isAlreadySaved);
                        _isAlreadySaved ? clickedUsers.remove(_userDetails[index].id) : clickedUsers.add(_userDetails[index].id);
                        print(clickedUsers);
                      });
                    },
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];

final String url = 'https://jsonplaceholder.typicode.com/users';
class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails({this.id, this.firstName, this.lastName, this.profileUrl = 'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}

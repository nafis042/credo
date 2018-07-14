import 'package:flutter/material.dart';
import 'package:flutter_app/AddTaskFormPage.dart';
import 'package:flutter_app/AddTaskFirst.dart';
import 'package:latlong/latlong.dart';

class SelectTaskPage extends StatefulWidget {

  SelectTaskPage({Key key, this.value, this.taskColor, this.selectedUser, this.position}) : super(key: key);
  final String value;
  final Color taskColor;
  final List<UserDetails> selectedUser;
  final LatLng position;

  @override
  SelectTaskPageState createState() => new SelectTaskPageState();
}

class SelectTaskPageState extends State<SelectTaskPage> {
  TextEditingController controller = new TextEditingController();



  @override
  void initState() {
    super.initState();

  }

  CheckColor(int index){
    switch(index % 6){
      case 0:
        return Color(0xFF1EBCE9);
      case 1:
        return Color(0xFF715DC8);
      case 2:
        return Color(0xFFB00020);
      case 3:
        return Color(0xFF25C27A);
      case 4:
        return Color(0xFFFFA726);
      case 5:
        return Color(0xFF37474F);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('Select Task Type'),
        centerTitle: true,
        backgroundColor: Color(0xFF25C27A),
        actions: <Widget>[
          Padding(
             padding: EdgeInsets.only(right: 16.0),
             child: Icon(Icons.playlist_add),
          ),

        ],

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
                return new Card(
                  child: new ListTile(
                    leading: new Material(
                      color: CheckColor(i),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      child: Container(
                        height: 24.0,
                        width: 24.0,
                        child: Center(

                          child: Text(_searchResult[i][0], style: TextStyle(color: Colors.white),),
                        ),
                      ),

                    ),
                    title: new Text(_searchResult[i]),
                    onTap: (){
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new AddTaskFormPage(value: _searchResult[i]),
                      );
                      Navigator.of(context).push(route);
                    },
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            )
                : new ListView.builder(
              itemCount: _userDetails.length,
              itemBuilder: (context, index) {


                return new Card(
                  child: new ListTile(
                    leading: new Material(
                      color: CheckColor(index),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      child: Container(
                        height: 24.0,
                        width: 24.0,
                        child: Center(

                          child: Text(_userDetails[index][0], style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      
                    ),
                    title: new Text(_userDetails[index]),

                    onTap: (){

                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new AddTaskFormPage(value: _userDetails[index], taskColor: CheckColor(index), selectedUser: widget.selectedUser,
                        position: widget.position,),
                      );
                      Navigator.of(context).push(route);


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
      if (userDetail.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<String> _searchResult = [];

List<String> _userDetails = ['Pickup', 'Dropoff', 'Payment Collection', 'Return', 'Refueling', 'Maintenance', 'Journey Start', 'Journey End', 'Others'];


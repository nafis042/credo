import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



class TaskPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
        home: new TaskSearchBarDemoHome());
  }
}


class TaskSearchBarDemoHome extends StatefulWidget {
  @override
  _TaskSearchBarDemoHomeState createState() => new _TaskSearchBarDemoHomeState();
}

class _TaskSearchBarDemoHomeState extends State<TaskSearchBarDemoHome> {

  bool _isSearching = false;
  bool showClearButton = true;
  bool _clearActive = false;
  final TextEditingController _searchQuery = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  List data;


  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });
    print(data[1]["title"]);

    return "Success!";
  }


  void _handleSearchBegin() {
    ModalRoute.of(context).addLocalHistoryEntry(new LocalHistoryEntry(
      onRemove: () {
        setState(() {
          _isSearching = false;
          _searchQuery.clear();
        });
      },
    ));
    setState(() {
      _isSearching = true;
    });
  }

  AppBar buildAppBar() {
    return new AppBar(
      leading:   new IconButton(
        icon: const Icon(Icons.search),
        onPressed: _handleSearchBegin,
        tooltip: 'Search',
      ),
        title: new Text('Tasks'),
        centerTitle: true,
        );
  }

  void onSubmitted(String value) {
    print(value);
    setState(() => _scaffoldKey1.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  void onChanged(String value) {
    print(value);

  }


  Widget buildSearchBar() {


    this._searchQuery.addListener(() {
      if (this._searchQuery.text.isEmpty) {
        // If clear is already disabled, don't disable it
        if (_clearActive) {
          setState(() {
            _clearActive = false;
          });
        }

        return;
      }

      // If clear is already enabled, don't enable it
      if (!_clearActive) {
        setState(() {
          _clearActive = true;
        });
      }
    });


    return new AppBar(

      leading: new BackButton(
        color: Colors.white,
      ),
      title: new TextField(
        onChanged: (String value){
          onChanged(value);
        },
        onSubmitted: (String value){
          onSubmitted(value);
        },
        keyboardType: TextInputType.text,
        controller: _searchQuery,
        style: TextStyle(color: Colors.white),
        autofocus: true,
        decoration: InputDecoration.collapsed(hintText: 'Search', hintStyle: TextStyle(color: Colors.white70)),

      ),
      actions: !showClearButton ? null : <Widget>[
        // Show an icon if clear is not active, so there's no ripple on tap
        new IconButton(
            icon: new Icon(Icons.clear, color: _clearActive ? Colors.white : Colors.white70),
            disabledColor: Colors.white70,
            onPressed: !_clearActive ? null : () { _searchQuery.clear(); })
      ],
      backgroundColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: _isSearching ? buildSearchBar() : buildAppBar(),
      key: _scaffoldKey1,
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: Row(

              children: <Widget>[

                Image(image: AssetImage("assets/profile_image.png"), height: 45.0),
                SizedBox(width: 16.0,),
                new Flexible(
                    child: Column(
                      children: <Widget>[
                        new Text(data[index]["title"]),
                      ],
                    )
                )

              ],
            ),


          );
        },
      ),
      bottomNavigationBar: Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
        elevation: 0.0,
        child: MaterialButton(
          onPressed: () {
            print("abc");
          },
          //height: 48,
          height: 48.0,
          color: Color(0xFF25C27A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Add a Task', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
              Icon(Icons.add, color: Colors.white)
            ],
          ),
        ),
      ),

    );
  }
}
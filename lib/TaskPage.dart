import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/AddTaskFormPage.dart';
import 'package:flutter_app/SingleTaskViewPage.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskSearchBarDemoHomeState createState() => new _TaskSearchBarDemoHomeState();
}

class _TaskSearchBarDemoHomeState extends State<TaskPage> {

  bool _isSearching = false;
  bool showClearButton = true;
  bool _clearActive = false;
  final TextEditingController _searchQuery = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  List data;

  List FakeData = [

    {
      'name': 'Mohammad Hasan\'s House',
      'time': 'Today • 5:15pm • 1:00 hour',
      'address': '16/9, Block A, Baridhara, Dhaka',
      'job_type': 'Installation',
      'status': 'In Progress'

    },


    {
      'name': 'Julian\'s Work',
      'time': 'Today • 5:15pm • 1:00 hour',
      'address': '16/9, Block A, Baridhara, Dhaka',
      'status': 'Delayed',
      'job_type': 'Pickup'

    },


    {
      'name': 'Sundar Pichai\'s House',
      'time': 'Today • 5:15pm • 1:00 hour',
      'address': '16/9, Block A, Baridhara, Dhaka',
      'status': 'Posponed',
      'job_type': 'Sales'

    },


    {
      'name': 'Ahamanat Ahsan\'s House',
      'time': 'Today • 5:15pm • 1:00 hour',
      'address': '16/9, Block A, Baridhara, Dhaka',
      'status': 'Unassigned',
      'job_type': 'Delivery'

    },

    {
      'name': 'Mohammad Hasan\'s House',
      'time': 'Today • 5:15pm • 1:00 hour',
      'address': '16/9, Block A, Baridhara, Dhaka',
      'job_type': 'Installation',
      'status': 'In Progress'

    },


    {
      'name': 'Julian\'s Work',
      'time': 'Today • 5:15pm • 1:00 hour',
      'address': '16/9, Block A, Baridhara, Dhaka',
      'status': 'Delayed',
      'job_type': 'Pickup'

    },


    {
      'name': 'Sundar Pichai\'s House',
      'time': 'Today • 5:15pm • 1:00 hour',
      'address': '16/9, Block A, Baridhara, Dhaka',
      'status': 'Posponed',
      'job_type': 'Sales'

    },


    {
      'name': 'Ahamanat Ahsan\'s House',
      'time': 'Today • 5:15pm • 1:00 hour',
      'address': '16/9, Block A, Baridhara, Dhaka',
      'status': 'Unassigned',
      'job_type': 'Delivery'

    },



  ];

  CheckBorderColor(String input){
    if(input[0] == 'I'){
      return Color(0xFF85DBF3);
    }
    else if(input[0] == 'U'){
      return Color(0xFFF491B2);
    }
    else if(input[0] == 'D'){
      return Color(0xFFFCBA9A);
    }
    else if(input[0] == 'P'){
      return Color(0xFF757575);
    }
  }


  @override
  void initState() {
    super.initState();
    //this.getData();
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
        backgroundColor: Color(0xFF25C27A),
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
        itemCount: FakeData == null ? 0 : FakeData.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            onTap: (){
              print('tapped');
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => SingleTaskViewPage()),
              );
            },
            isThreeLine: true,
            title: Text(FakeData[index]['name']),
            subtitle: Container(
              width: MediaQuery.of(context).size.width,
              height: 90.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(FakeData[index]['time']),
                  Text(FakeData[index]['address']),
                  Row(
                    children: <Widget>[
                      Material(
                        color: CheckColor(index),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        child: Container(
                          height: 24.0,
                          width: 24.0,
                          child: Center(

                            child: Text(FakeData[index]['job_type'][0], style: TextStyle(color: Colors.white),),
                          ),
                        ),

                      ),
                      SizedBox(width: 16.0),
                      Text(FakeData[index]['job_type'])
                    ],
                  ),

                ],
              ),
            ),
            trailing:
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          OutlineButton(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
                            borderSide: BorderSide(color: CheckBorderColor(FakeData[index]['status']), width: 2.0),
                            highlightColor: Colors.white,
                            onPressed: () {
                              print("free");
                            },
                            child: Text(FakeData[index]['status'], style: TextStyle(color: CheckBorderColor(FakeData[index]['status']), fontSize: 12.0),),
                          ),
                          SizedBox(height: 8.0,),
                          Image(image: AssetImage('assets/profile_image.png'), height: 50.0, width: 50.0,)
                        ],
                    ),
                  )



          );
        },
      ),
      bottomNavigationBar: Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
        elevation: 0.0,
        child: MaterialButton(
          onPressed: () {
            print("abc");
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTaskFormPage()),
            );
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
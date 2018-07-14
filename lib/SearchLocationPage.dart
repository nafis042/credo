import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



//class SearchLocationPage extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        theme: new ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
//        home: new SearchBarLocationDemoHome());
//  }
//}
//
//
//class SearchBarLocationDemoHome extends StatefulWidget {
//  @override
//  _SearchBarLocationDemoHomeState createState() => new _SearchBarLocationDemoHomeState();
//}
//
//
//class _SearchBarLocationDemoHomeState extends State<SearchBarLocationDemoHome>{
//
//  bool _isSearching = false;
//  bool showClearButton = true;
//  bool _clearActive = false;
//  final TextEditingController _searchQuery = new TextEditingController();
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//  void _handleSearchBegin() {
//    ModalRoute.of(context).addLocalHistoryEntry(new LocalHistoryEntry(
//      onRemove: () {
//        setState(() {
//          _isSearching = false;
//          _searchQuery.clear();
//        });
//      },
//    ));
//    setState(() {
//      _isSearching = true;
//    });
//  }
//
//  Widget buildSearchBar() {
//
//
//    this._searchQuery.addListener(() {
//      if (this._searchQuery.text.isEmpty) {
//        // If clear is already disabled, don't disable it
//        if (_clearActive) {
//          setState(() {
//            _clearActive = false;
//          });
//        }
//
//        return;
//      }
//
//      // If clear is already enabled, don't enable it
//      if (!_clearActive) {
//        setState(() {
//          _clearActive = true;
//        });
//      }
//    });
//
//    return new AppBar(
//
//      leading: new BackButton(
//        color: Colors.white,
//      ),
//      title: new TextField(
//          onChanged: (String value){
//            onChanged(value);
//          },
//          onSubmitted: (String value){
//            onSubmitted(value);
//          },
//          controller: _searchQuery,
//          style: TextStyle(color: Colors.white),
//          autofocus: true,
//          decoration: InputDecoration.collapsed(hintText: 'Search', hintStyle: TextStyle(color: Colors.white70))
//      ),
//      actions: !showClearButton ? null : <Widget>[
//        // Show an icon if clear is not active, so there's no ripple on tap
//        new IconButton(
//            icon: new Icon(Icons.clear, color: _clearActive ? Colors.white : Colors.white70),
//            disabledColor: Colors.white70,
//            onPressed: !_clearActive ? null : () { _searchQuery.clear(); })
//      ],
//      backgroundColor: Colors.green,
//    );
//  }
//
//  AppBar buildAppBar() {
//    return new AppBar(
//        leading: new IconButton(
//          icon: const Icon(Icons.search),
//          onPressed: _handleSearchBegin,
//          tooltip: 'Search',
//        ),
//        title: new Text('TeamWork'),
//        centerTitle: true,
//        actions: [ Row(
//          children: <Widget>[
//            Image(image: AssetImage("assets/profile_image.png"), height: 45.0), SizedBox(width: 8.0,)
//          ],
//
//        )]);
//  }
//
//  void onSubmitted(String value) {
//    print(value);
//    setState(() => _scaffoldKey.currentState
//        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
//  }
//
//  void onChanged(String value) {
//    print(value);
//
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//
//
//    return new Scaffold(
//        resizeToAvoidBottomPadding: false,
//        appBar: _isSearching ? buildSearchBar() : buildAppBar(),
//        key: _scaffoldKey,
//        body: new ListView(
//          shrinkWrap: true,
//          padding: const EdgeInsets.only(top: 20.0),
//          children: <Widget>[
//            new Container(
//              color: Colors.white,
//              width: MediaQuery.of(context).size.width,
//              height: 80.0,
//              padding: EdgeInsets.all(16.0),
//              child: Column(
//                children: <Widget>[
//                  Material(
//                    borderRadius: BorderRadius.circular(6.0),
//                    elevation: 0.0,
//                    child: MaterialButton(
//                      onPressed: () {
//                        print("abc");
//
//                        Navigator.pop(context, 'Yep!');
//                        //Navigator.pop(context);
//                      },
//                      //height: 48,
//                      height: 48.0,
//                      color: Color(0xFFB00020),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text('02 Emergencies', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
//                          Image(image: AssetImage("assets/alert.png"), height: 15.0)
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//
//              ),
//            ),
//
//
//
//
//          ],
//        )
//    );
//  }
//}



class SearchLocationPage extends StatefulWidget {

  @override
  _SearchLocationPageState createState() => new _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage>{


  bool showClearButton = true;
  bool _clearActive = false;
  final TextEditingController _searchQuery = new TextEditingController();

  List data;
  var initData;

  Future<String> getData(String value) async {
    var response = await http.get(
        Uri.encodeFull("https://ios.api.dingi.live/maps/v2/search?q=$value&language=en"),
        headers: {
          "x-api-key": "FERG7b1Y6w1j3owzqIPzZ6bGBFLWYvvH4mo6sGyM"
        }
    );
    setState(() {
      initData = JSON.decode(response.body);
      data = initData['result'];
    });

//    for(var index in initData['result']){
//      print(index['name']);
//      data.add(index);
//    }


    return "Success!";
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF25C27A),
        title: new TextField(
          onChanged: (String value){
            print(value);
            getData(value);
          },
          onSubmitted: (String value){
            print(value);
          },
          controller: _searchQuery,
          style: TextStyle(color: Colors.white),
          autofocus: true,
          decoration: InputDecoration.collapsed(hintText: 'Search Location Here', hintStyle: TextStyle(color: Colors.white70))
      ),
      actions: !showClearButton ? null : <Widget>[
        // Show an icon if clear is not active, so there's no ripple on tap
        new IconButton(
            icon: new Icon(Icons.clear, color: _clearActive ? Colors.white : Colors.white70),
            disabledColor: Colors.white70,
            onPressed: (){
              setState(() {
                _searchQuery.clear();
                data.clear();
              });


            })
      ],


      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(data[index]["name"]),
            isThreeLine: true,
            subtitle: Text(data[index]["address"]),
            trailing: Image(image: AssetImage("assets/address.png"), height: 45.0),
            onTap: (){
              print('tapped');
              print(data[index]["location"]);
              Navigator.pop(context, data[index]);
            },


          );
        },
      ),
    );
  }
}
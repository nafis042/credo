import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



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
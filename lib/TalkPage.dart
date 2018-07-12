import 'package:flutter/material.dart';

class TalkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
          padding: EdgeInsets.only(top: 250.0),
        child:
            ListView(
              children: <Widget>[

                new TextField(
                  onChanged: (String value){
                    // onChanged(value);
                  },
                  onSubmitted: (String value){
                    //  onSubmitted(value);
                  },
                  keyboardType: TextInputType.text,
                  // controller: _searchQuery,
                  style: TextStyle(color: Colors.white),
                  autofocus: false,
                  decoration: InputDecoration.collapsed(hintText: 'Search', hintStyle: TextStyle(color: Colors.green)),

                ),
              ],
            )




    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';



class OverViewPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
        home: new SearchBarDemoHome());
  }
}


class SearchBarDemoHome extends StatefulWidget {
  @override
  _SearchBarDemoHomeState createState() => new _SearchBarDemoHomeState();
}


class _SearchBarDemoHomeState extends State<SearchBarDemoHome>{

  bool _isSearching = false;
  bool showClearButton = true;
  bool _clearActive = false;
  final TextEditingController _searchQuery = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
        controller: _searchQuery,
        style: TextStyle(color: Colors.white),
        autofocus: true,
        decoration: InputDecoration.collapsed(hintText: 'Search', hintStyle: TextStyle(color: Colors.white70))
      ),
      actions: !showClearButton ? null : <Widget>[
        // Show an icon if clear is not active, so there's no ripple on tap
        new IconButton(
            icon: new Icon(Icons.clear, color: _clearActive ? Colors.white : Colors.white70),
            disabledColor: Colors.white70,
            onPressed: !_clearActive ? null : () { _searchQuery.clear(); })
      ],
      backgroundColor: Color(0xFF25C27A),
    );
  }

  AppBar buildAppBar() {
    return new AppBar(
        leading: new IconButton(
          icon: const Icon(Icons.search),
          onPressed: _handleSearchBegin,
          tooltip: 'Search',
        ),
        title: new Text('TeamWork'),
        backgroundColor: Color(0xFF25C27A),
        centerTitle: true,
        actions: [ Row(
          children: <Widget>[
            Image(image: AssetImage("assets/profile_image.png"), height: 45.0), SizedBox(width: 8.0,)
          ],

        )]);
  }

  void onSubmitted(String value) {
    print(value);
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  void onChanged(String value) {
    print(value);

  }



  @override
  Widget build(BuildContext context) {


    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _isSearching ? buildSearchBar() : buildAppBar(),
        key: _scaffoldKey,
        body: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 20.0),
          children: <Widget>[
            new Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 80.0,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(6.0),
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        print("abc");
                      },
                      //height: 48,
                      height: 48.0,
                      color: Color(0xFFB00020),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('02 Emergencies', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                          Image(image: AssetImage("assets/alert.png"), height: 15.0)
                        ],
                      ),
                    ),
                  )
                ],

              ),
            ),

            new Container(
              margin: EdgeInsets.only(top: 8.0),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 410.0,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Today\'s Tasks • 10 of 32 Finished', textAlign: TextAlign.left,),
                  SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        OutlineButton(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          borderSide: BorderSide(color: Colors.green, width: 2.0),
                          highlightColor: Colors.white,
                          onPressed: () {
                            print("remaining");
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(height: 16.0, width: 50.0,),
                              Text('Remaining', style: TextStyle(fontFamily: 'Poppins')),
                              SizedBox(height: 20.0,),
                              Text('04', style: TextStyle(fontFamily: 'Poppins', color: Colors.green, fontSize: 25.0)),
                              SizedBox(height: 16.0,),
                            ],
                          ),
                        ),

                        OutlineButton(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          borderSide: BorderSide(color: Color(0xFF1EBCE9), width: 2.0),
                          highlightColor: Colors.white,
                          onPressed: () {
                            print("In Progress");
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(height: 16.0,),
                              Text('In Progress', style: TextStyle(fontFamily: 'Poppins')),
                              SizedBox(height: 20.0,),
                              Text('10', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF1EBCE9), fontSize: 25.0)),
                              SizedBox(height: 16.0,),
                            ],
                          ),
                        ),


                    ],
                  ),
                  SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OutlineButton(
                        padding: EdgeInsets.only(left: 50.0, right: 50.0),
                        borderSide: BorderSide(color: Color(0xFFFA8045), width: 2.0),
                        highlightColor: Colors.white,
                        onPressed: () {
                          print("Delayed");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: 16.0, width: 50.0,),
                            Text('Delayed', style: TextStyle(fontFamily: 'Poppins')),
                            SizedBox(height: 20.0,),
                            Text('04', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFFFA8045), fontSize: 25.0)),
                            SizedBox(height: 16.0,),
                          ],
                        ),
                      ),

                      OutlineButton(
                        padding: EdgeInsets.only(left: 45.0, right: 45.0),
                        borderSide: BorderSide(color: Color(0xFFB00020), width: 2.0),
                        highlightColor: Colors.white,
                        onPressed: () {
                          print("Canceled");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: 16.0,),
                            Text('Canceled', style: TextStyle(fontFamily: 'Poppins')),
                            SizedBox(height: 20.0,),
                            Text('20', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFFB00020), fontSize: 25.0)),
                            SizedBox(height: 16.0,),
                          ],
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 16.0,),
                  Material(
                    borderRadius: BorderRadius.circular(6.0),
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        print("Add a task");
                      },
                      //height: 48,
                      height: 48.0,
                      color: Color(0xFF25C27A),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Add A Task', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                          new Icon(Icons.add, color: Colors.white),
                          //Image(image: AssetImage("assets/alert.png"), height: 15.0)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Material(
                    borderRadius: BorderRadius.circular(6.0),
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        print("Unassigned Tasks");
                      },
                      //height: 48,
                      height: 48.0,
                      color: Color(0xFFE91E63),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('14 Unassigned Tasks', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                          new Icon(Icons.arrow_forward, color: Colors.white),
                          //Image(image: AssetImage("assets/alert.png"), height: 15.0)
                        ],
                      ),
                    ),
                  ),

                ],



              ),

            ),




            new Container(
              margin: EdgeInsets.only(top: 8.0),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 350.0,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Agents • 15 of 30 Available', textAlign: TextAlign.left,),
                  SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OutlineButton(
                        padding: EdgeInsets.only(left: 53.0, right: 53.0),
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        highlightColor: Colors.white,
                        onPressed: () {
                          print("free");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: 16.0, width: 50.0,),
                            Text('Free', style: TextStyle(fontFamily: 'Poppins')),
                            SizedBox(height: 20.0,),
                            Text('04', style: TextStyle(fontFamily: 'Poppins', color: Colors.green, fontSize: 25.0)),
                            SizedBox(height: 16.0,),
                          ],
                        ),
                      ),

                      OutlineButton(
                        padding: EdgeInsets.only(left: 51.0, right: 51.0),
                        borderSide: BorderSide(color: Color(0xFF1EBCE9), width: 2.0),
                        highlightColor: Colors.white,
                        onPressed: () {
                          print("working");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: 16.0,),
                            Text('Working', style: TextStyle(fontFamily: 'Poppins')),
                            SizedBox(height: 20.0,),
                            Text('10', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF1EBCE9), fontSize: 25.0)),
                            SizedBox(height: 16.0,),
                          ],
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OutlineButton(
                        padding: EdgeInsets.only(left: 53.0, right: 53.0),
                        borderSide: BorderSide(color: Color(0xFFFA8045), width: 2.0),
                        highlightColor: Colors.white,
                        onPressed: () {
                          print("absent");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: 16.0, width: 50.0,),
                            Text('Absent', style: TextStyle(fontFamily: 'Poppins')),
                            SizedBox(height: 20.0,),
                            Text('04', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFFFA8045), fontSize: 25.0)),
                            SizedBox(height: 16.0,),
                          ],
                        ),
                      ),

                      OutlineButton(
                        padding: EdgeInsets.only(left: 34.0, right: 34.0),
                        borderSide: BorderSide(color: Color(0xFFB00020), width: 2.0),
                        highlightColor: Colors.white,
                        onPressed: () {
                          print("unreachable");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: 16.0,),
                            Text('Unreachable', style: TextStyle(fontFamily: 'Poppins')),
                            SizedBox(height: 20.0,),
                            Text('20', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFFB00020), fontSize: 25.0)),
                            SizedBox(height: 16.0,),
                          ],
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 16.0,),
                  Material(
                    borderRadius: BorderRadius.circular(6.0),
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        print("Add a task");
                      },
                      //height: 48,
                      height: 48.0,
                      color: Color(0xFF25C27A),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Add Agent', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                          new Icon(Icons.add, color: Colors.white),
                          //Image(image: AssetImage("assets/alert.png"), height: 15.0)
                        ],
                      ),
                    ),
                  ),

                ],



              ),

            ),

            new Container(
              margin: EdgeInsets.only(top: 8.0),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 168.0,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('More Stuffs'),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFDEDEDE),
                    height: 1.0,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(0.0),
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        print("abc");
                      },
                      //height: 48,
                      height: 48.0,
                      padding: EdgeInsets.only(left: 0.0, right: 0.0),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Billing Details', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF25C27A))),
                          Icon(Icons.arrow_forward, color: Color(0xFF25C27A),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0.0),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFDEDEDE),
                    height: 1.0,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(0.0),
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        print("abc");
                      },
                      //height: 48,
                      height: 48.0,
                      padding: EdgeInsets.only(left: 0.0, right: 0.0),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Data Usage Of Agents', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF25C27A))),
                          Icon(Icons.arrow_forward, color: Color(0xFF25C27A),)
                        ],
                      ),
                    ),
                  ),


                ],

              ),
            ),

//            const Text('I\'m dedicating every day to you'),
//            const Text('Domestic life was never quite my style'),
//            const Text('When you smile, you knock me out, I fall apart'),
//            const Text('And I thought I was so smart'),
          ],
        )
    );
  }
}
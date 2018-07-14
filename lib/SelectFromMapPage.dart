import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'AddTaskFirst.dart';
import 'package:flutter_app/AddTaskFormPage.dart';
import 'dart:async';
import 'SearchLocationPage.dart';

class SelectFromMapPage extends StatefulWidget {
  SelectFromMapPage({Key key, this.value, this.taskColor, this.selectedUser}) : super(key: key);
  final  String value;
  final Color taskColor;
  final List<UserDetails> selectedUser;

  @override
  SelectFromMapPageState createState() {
    return new SelectFromMapPageState();
  }
}

class SelectFromMapPageState extends State<SelectFromMapPage>{

  static LatLng centerPosition;
  static MapController mapController;
  var address = 'Search Address Here';
  static var latitude = 23.7805461;
  static var longitude = 90.4179039;

  void initState() {
    super.initState();
    mapController = new MapController();
    centerPosition = temp.options.center;
  }

  static handleTap(LatLng latlng){

      print(latlng);

  }

  var temp = new FlutterMap(
    mapController: mapController,
    options: new MapOptions(
      center: new LatLng(latitude, longitude),
      zoom: 15.0,
      maxZoom: 22.0,
      minZoom: 3.0,
      onTap: handleTap,
      onPositionChanged: (MapPosition m){
        centerPosition = m.center;
      }
    ),
    layers: [
      new TileLayerOptions(
        urlTemplate: "https://api.mapbox.com/v4/"
            "{id}/{z}/{x}/{y}@2x.png?access_token=pk.eyJ1IjoibmFmaXMwMDAxIiwiYSI6ImNqOW1rNnhxbTB0N2Yyd250cXJxeGxiMWQifQ.D6rR_E-7XO_OJMsMDUPLXw",
        additionalOptions: {
          'accessToken': 'pk.eyJ1IjoibmFmaXMwMDAxIiwiYSI6ImNqOW1rNnhxbTB0N2Yyd250cXJxeGxiMWQifQ.D6rR_E-7XO_OJMsMDUPLXw',
          'id': 'mapbox.streets',
        },
      ),
    ],
  );

  _navigateAndDisplaySelection(BuildContext context) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchLocationPage()),
    );

    // After the Selection Screen returns a result, show it in a Snackbar!
    setState(() {
      address = result['name'];
      latitude = result['location'][0];
      longitude = result['location'][1];
      mapController.move(new  LatLng(latitude, longitude), 15.0);
    });

    print(result);

    //Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
  }

  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: Container(
         height: 96.0,
          child:       Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
                elevation: 0.0,
                child: MaterialButton(
                  onPressed: () {
                    print("abc");

                    _navigateAndDisplaySelection(context);



                  },
                  height: 48.0,
                  color: Colors.white,
                  child: Row(

                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_left, color: Color(0xFF404041)),
                      SizedBox(width: 16.0,),
                      Text(address, style: TextStyle(fontFamily: 'Poppins')),

                    ],
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
                elevation: 0.0,
                child: MaterialButton(
                  onPressed: () {
                        print('location picked');
                        print('map debug');

                        print(centerPosition);
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new AddTaskFormPage(selectedUser: widget.selectedUser, value: widget.value, taskColor: widget.taskColor, position: centerPosition),
                        );
                        Navigator.of(context).push(route);


                  },
                  //height: 48,
                  height: 48.0,
                  color: Color(0xFF25C27A),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Done', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                      Icon(Icons.check, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),



      body:
          Stack(
            fit: StackFit.expand,
            children: <Widget>[
//              new FlutterMap(
//                mapController: mapController,
//                options: new MapOptions(
//                  center: new LatLng(23.7805461, 90.4179039),
//                  zoom: 15.0,
//                  maxZoom: 22.0,
//                  minZoom: 3.0,
//                  onTap: handleTap,
//                ),
//                layers: [
//                  new TileLayerOptions(
//                    urlTemplate: "https://api.mapbox.com/v4/"
//                        "{id}/{z}/{x}/{y}@2x.png?access_token=pk.eyJ1IjoibmFmaXMwMDAxIiwiYSI6ImNqOW1rNnhxbTB0N2Yyd250cXJxeGxiMWQifQ.D6rR_E-7XO_OJMsMDUPLXw",
//                    additionalOptions: {
//                      'accessToken': 'pk.eyJ1IjoibmFmaXMwMDAxIiwiYSI6ImNqOW1rNnhxbTB0N2Yyd250cXJxeGxiMWQifQ.D6rR_E-7XO_OJMsMDUPLXw',
//                      'id': 'mapbox.streets',
//                    },
//                  ),
//                ],
//              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: temp,
              ),

              Center(  
                child:

                Image(image: AssetImage('assets/Pin.png'), height: 35.0, width: 35.0,),
              ),

            ],
          )



    );









  }


}

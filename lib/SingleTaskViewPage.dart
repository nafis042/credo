import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';

class SingleTaskViewPage extends StatelessWidget {


  SeparatorBar() {
    return Container(
      height: 0.5,
      color: Color(0xFFDEDEDE),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
        elevation: 0.0,
        child: MaterialButton(
          onPressed: () {
            print("abc");
//            Navigator.push(context,
//              MaterialPageRoute(builder: (context) => AddTaskFormPage()),
//            );
          },
          //height: 48,
          height: 48.0,
          color: Color(0xFF25C27A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Edit Task', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
              Icon(Icons.edit, color: Colors.white)
            ],
          ),
        ),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 250.0,
            leading: BackButton(
              color: Color(0xFF404041),
            ),
            floating: true,
            pinned: false,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text("Ahmed Hasan\'s House", style: TextStyle(color: Color(0xFF404041), fontSize: 14.0),),
              background: Container(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      new FlutterMap(
                        options: new MapOptions(
                          center: new LatLng(23.7925, 90.4078),
                          zoom: 15.0,
                          maxZoom: 22.0,
                          minZoom: 3.0,
                          interactive: false,
                          onTap: (abc){
                            print('tapped');
                          },

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
                          new MarkerLayerOptions(markers: [new Marker(point: new LatLng(23.7925, 90.4078),
                              builder: (ctx) => new Container(
                                child: new Image(image: AssetImage('assets/Pin.png'), height: 30.0, width: 30.0,

                                ),
                              ))]),
                        ],
                      ),

                      new Container(
                        height: 300.0,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromARGB(100, 255, 255, 255),
                      )
                    ],
                  )


              ),
            ),
          ),

          new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
                  ListTile(
                    leading: Icon(Icons.event, color: Color(0xFF404041),),
                    title: Text(' Today • Tuesday, May 18 '),
                  ),
              SeparatorBar(),
                  ListTile(
                    leading: Icon(Icons.schedule, color: Color(0xFF404041),),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('9:00 PM'),
                        Icon(Icons.timeline)
                      ],
                    ),
                    trailing: Text('30 min'),

                  ),
                  SeparatorBar(),
                  ListTile(

                    leading: Icon(Icons.location_on, color: Color(0xFF404041),),
                    title: Text('T 131'),
                    subtitle: Text('Floor 6, Gulshan Badda Link Road'),
                  ),
                  SeparatorBar(),
                  ListTile(

                    leading: new Material(
                      color: Color(0xFF1EBCE9),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      child: Container(
                        height: 24.0,
                        width: 24.0,
                        child: Center(

                          child: Text('D', style: TextStyle(color: Colors.white),),
                        ),
                      ),

                    ),
                    title: Text('Delivery'),
                  ),
                  SeparatorBar(),
                  ListTile(
                    leading: Icon(Icons.account_circle, color: Color(0xFF404041),),
                    title: Text('Md Riajul Islam'),
                    trailing: Image(image: AssetImage('assets/profile_image.png'), height: 50.0, width: 50.0,),
                  ),
                  SeparatorBar(),
                  ListTile(
                    leading: Icon(Icons.playlist_add, color: Color(0xFF404041),),
                    title: Text('Important'),
                    subtitle: Text('Dont Forget Taka tuka'),

                  ),
                  SeparatorBar(),
                  ListTile(
                    leading: Icon(Icons.playlist_add, color: Color(0xFF404041),),
                    title: Text('Notes'),
                    subtitle: Text('Just some random thoughts'),

                  ),
                  SeparatorBar(),
                  ListTile(
                    leading: Icon(Icons.repeat, color: Color(0xFF404041),),
                    title: Text('Do Not Repeat'),
                    subtitle: Text('Just some random thoughts'),

                  ),
                  SeparatorBar(),
          ])

          ),




    ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';


class TeamPage extends StatefulWidget {
  static const String route = 'map_controller';

  @override
  MapControllerPageState createState() {
    return new MapControllerPageState();
  }
}

class MapControllerPageState extends State<TeamPage> {
  static LatLng london = new LatLng(51.5, -0.09);
  static LatLng paris = new LatLng(48.8566, 2.3522);
  static LatLng dublin = new LatLng(53.3498, -6.2603);

  MapController mapController;

  void initState() {
    super.initState();
    mapController = new MapController();
  }

  Widget build(BuildContext context) {

    return new FlutterMap(
                mapController: mapController,
                options: new MapOptions(
                    center: new LatLng(23.7805461, 90.4179039),
                    zoom: 15.0,
                    maxZoom: 22.0,
                    minZoom: 3.0
                ),
                layers: [
//                  new TileLayerOptions(
//                      urlTemplate:
//                      "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                      subdomains: ['a', 'b', 'c']),
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





  }
}

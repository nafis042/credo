import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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
                  new TileLayerOptions(
                      urlTemplate:
                      "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                ],
              );





  }
}
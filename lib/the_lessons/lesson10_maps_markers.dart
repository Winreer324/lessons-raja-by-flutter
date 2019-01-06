import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

//lessons 10
// Flutter - Maps & Markers
//link video https://www.youtube.com/watch?v=qme30VC1yqk&index=13&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageMapsMarkersState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaflet Maps & Markers"),
      ),
      body: FlutterMap(
        options: MapOptions(
          minZoom: 10,
          maxZoom: 200,
          center: LatLng(47.22,39.71)
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 45,
                height: 45,
                point: LatLng(47.22,39.71),
                builder: (context) => Container(
                  child: IconButton(
                    icon: Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45,
                    onPressed: (){
                      print("Marker RND tapped");
                    },
                  ),
                )
              ),
            ]
          ),
          MarkerLayerOptions(
              markers: [
                Marker(
                    width: 45,
                    height: 45,
                    point: LatLng(47.15,39.74),
                    builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.blue,
                        iconSize: 45,
                        onPressed: (){
                          print("Marker Bat tapped");
                        },
                      ),
                    )
                ),
              ]
          ),
        ],
      ),
    );
  }
}
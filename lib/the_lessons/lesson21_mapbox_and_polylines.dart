import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

//lessons 21
// Flutter - Mapbox and Polylines
//link video https://www.youtube.com/watch?v=oc1mktx0Zn8&index=29&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi
// https://www.mapbox.com/account/      для создание статической мапы

class HomePageMapboxPolylinesState extends State<MyHomePage> {
  String url = "https://api.mapbox.com/styles/v1/winreer321/cjqml4sdv54nq2smia95aut4l/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoid2lucmVlcjMyMSIsImEiOiJjanFta2NmOXgwMnJxNDRvYzd4dWg0dG50In0.A7sA8aJn7bXrOYGUotvIJw";

  var points = <LatLng>[
    LatLng(47.22,39.71),
    LatLng(47.34,39.85),
    LatLng(47.47,39.97),
    LatLng(47.59,40.78),
    LatLng(47.15,39.74),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapbox and Polylines"),
      ),
      body: FlutterMap(
        options: MapOptions(
          minZoom: 5,
          center: LatLng(47.22,39.71)
        ),
        layers: [
          TileLayerOptions(
              urlTemplate:
              url,
              additionalOptions: {
                'accessToken':
                'pk.eyJ1Ijoid2lucmVlcjMyMSIsImEiOiJjanFta3E5MmI2bXlvNDJwcDNqazlhbWVkIn0.dbIIkZjCuMMN-3J06XJ5yw',
                'id': 'mapbox.mapbox-streets-v7'
            }
          ),
          PolylineLayerOptions(
            polylines: [
              Polyline(
                points: points,
                strokeWidth: 5,
                color: Colors.lightBlue
              )
            ]
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
import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geocoder/geocoder.dart';

//lessons 12
// Flutter - Geocoding with maps
//link video https://www.youtube.com/watch?v=NT9-l2CuRHM&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi&index=16

class HomePageGeocodingState extends State<MyHomePage> {

  List<Marker> allMarkers = [];

  setMarkers() {
    allMarkers.add(
        Marker(
            width: 45.0,
            height: 45.0,
            point: new LatLng(40.71, -74.00),
            builder: (context) => new Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () {
                },
              ),
            )
        )
    );
    return allMarkers;
  }

  addToList() async {
    print("sdfsadf");
    final query = "Hodoken, New York";
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    setState(() {
      allMarkers.add(
        Marker(
          width: 45.0,
          height: 45.0,
          point: new LatLng(first.coordinates.latitude, first.coordinates.longitude),
          builder: (context) => new Container(
            child: IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.blue,
              iconSize: 45.0,
              onPressed: () {
                print(first.featureName);
              },
            ),
          )
        )
      );
    });
  }

  Future addMarker() async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text(
              'Add Marker',
              style: new TextStyle(fontSize: 17.0),
            ),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text('Add It',
                    style: new TextStyle(color: Colors.blue)),
                onPressed: () {
                  addToList();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Leaflet Maps'),
          leading: new IconButton(
            icon: Icon(Icons.add),
            onPressed: addMarker,
          ),
          centerTitle: true,
        ),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(40.71, -74.00), minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: setMarkers())
            ]
        )
    );
  }
}
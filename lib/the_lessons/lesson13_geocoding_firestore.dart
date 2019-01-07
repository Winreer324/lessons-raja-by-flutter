import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

import 'package:flutter_map/flutter_map.dart';

import 'package:latlong/latlong.dart';
import 'package:geocoder/geocoder.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

//lessons 13-14
// Flutter - Retrieving markers from FireStore / Saving markers to firestore
//link video https://www.youtube.com/watch?v=NZRocXb7qwU&index=17&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi
// https://www.youtube.com/watch?v=Rxf4pajebsM&index=18&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageGeocodingFirestoreState extends State<MyHomePage> {

  List<Marker> allMarkers = [];

  String addLocation = "";

  setMarkers() {
    return allMarkers;
  }

  addToList() async {
    final query = addLocation;
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    Firestore.instance.collection("markers").add({
      'coords' : GeoPoint(first.coordinates.latitude, first.coordinates.longitude),
      'place' : first.featureName
    });// add new object to fireStore
  }

  Future addMarker() async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Add Marker',
            style: TextStyle(fontSize: 17.0),
          ),
          children: <Widget>[
            TextField(
              onChanged: (String enterLocation){
                setState(() {
                  addLocation = enterLocation;
                });
              },
            ),
            SimpleDialogOption(
              child: Text('Add It',
                  style: TextStyle(color: Colors.blue)),
              onPressed: () {
                addToList();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  Widget loadMap(){
    return StreamBuilder(
      stream: Firestore.instance.collection("markers").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){return Text("Loading maps.... Please Wait!");}
        for(int i=0; i < snapshot.data.documents.length; i++){
          print(snapshot.data.documents[i]["coords"]);
          allMarkers.add(
              Marker(
                  width: 45.0,
                  height: 45.0,
                  point: LatLng(
                      snapshot.data.documents[i]["coords"].latitude,
                      snapshot.data.documents[i]["coords"].longitude
                  ),
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.red,
                      iconSize: 45.0,
                      onPressed: () {
                        print( snapshot.data.documents[i]["place"]);
                      },
                    ),
                  )
              )
          );
        }
        return FlutterMap(
            options: MapOptions(
                center: LatLng(47.22, 39.71), minZoom: 10.0),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(markers: allMarkers)
            ]
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Retrieving markers from Firestore'),
          leading: IconButton(
            icon: Icon(Icons.add),
            onPressed: addMarker,
          ),
          centerTitle: true,
        ),
        body: loadMap()
    );
  }
}
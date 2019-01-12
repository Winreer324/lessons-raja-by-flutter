import 'package:flutter/material.dart';
//import 'package:map_view/map_view.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 22 не сделал.......................
// Flutter - Google Maps, Markers and Polygons
//link video https://www.youtube.com/watch?v=UFJyCaScKD4&index=31&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageMarkersPolygons  extends StatefulWidget {
  @override
  HomePageMarkersPolygonsState createState() => HomePageMarkersPolygonsState();
}

class HomePageMarkersPolygonsState extends State<MyHomePage> {
//  MapView mapView = new MapView();


  displayMap() {
//    mapView.show(new MapOptions(
//        mapViewType: MapViewType.normal,
//        initialCameraPosition:
//        new CameraPosition(new Location(35.22, -101.83), 14.0),
//        showUserLocation: false,
//        title: 'Google Map'));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Google Maps'),
      ),
      body: new Center(
        child: Container(
          child: RaisedButton(
            child: Text('Tap me'),
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 7.0,
            onPressed: displayMap,
          ),
        ),
      ),
    );
  }
}
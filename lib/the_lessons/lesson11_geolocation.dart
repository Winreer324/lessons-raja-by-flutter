import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//import 'package:geolocation/geolocation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

//lessons 11
// Flutter - Geolocation with maps
//link video https://www.youtube.com/watch?v=I3bhRb6f5dA&index=14&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageGeolocationState extends State<MyHomePage> {
  MapController controller = new MapController();

  getPermission() async {
//    final GeolocationResult result =
//    await Geolocation.requestLocationPermission(const LocationPermission(
//        android: LocationPermissionAndroid.fine,
//        ios: LocationPermissionIOS.always));
//    return result;
  }

  getLocation() {
    return getPermission().then((result) async {
      if (result.isSuccessful) {
//        final coords =
//        await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
//        return coords;
      }
    });
  }

  buildMap() {
    getLocation().then((response) {
      response.listen((value) {
        if (value.isSuccessful) {
          controller.move(
              new LatLng(value.location.latitude, value.location.longitude),
              8.0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Geolocation'),
      ),
      body: new FlutterMap(
          mapController: controller,
          options: new MapOptions(center: buildMap(), minZoom: 5.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
          ]),
    );
  }
}
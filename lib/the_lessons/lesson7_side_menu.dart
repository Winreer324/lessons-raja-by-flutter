import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';
import 'package:raja_yogan/the_lessons/lesson7_side_menu_about.dart';

import 'package:raja_yogan/fireBase/authentication.dart';
import 'package:raja_yogan/the_lessons/lesson10_maps_markers.dart';
import 'package:raja_yogan/the_lessons/lesson11_geolocation.dart';
import 'package:raja_yogan/the_lessons/lesson12_geocoding.dart';
import 'package:raja_yogan/the_lessons/lesson13_geocoding_firestore.dart';
import 'package:raja_yogan/the_lessons/lesson14_animations.dart';
import 'package:raja_yogan/the_lessons/lesson15_gestures.dart';
import 'package:raja_yogan/the_lessons/lesson16_delayed_animations.dart';
import 'package:raja_yogan/the_lessons/lesson17_parenting_animations.dart';
import 'package:raja_yogan/the_lessons/lesson18_transforming_animations.dart';
import 'package:raja_yogan/the_lessons/lesson19_value_change_animations.dart';
import 'package:raja_yogan/the_lessons/lesson20_mixing_animations_with_ui.dart';
import 'package:raja_yogan/the_lessons/lesson21_mapbox_and_polylines.dart';
import 'package:raja_yogan/the_lessons/lesson22_markers_and_polygons.dart';
import 'package:raja_yogan/the_lessons/lesson6_input_widgets.dart';
import 'package:raja_yogan/the_lessons/lesson7_side_menu.dart';
import 'package:raja_yogan/the_lessons/lesson8_slivers.dart';
import 'package:raja_yogan/the_lessons/lesson9_charts.dart';

//lessons 7
//Flutter - Side menu
//link video https://www.youtube.com/watch?v=fuFdY0-iIPc&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi&index=7

class HomePageMenuState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Side menu"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Igor"),
              accountEmail: Text("32igor3@mail.ru"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
              ),
            ),
            ListTile(
              title: Text("About Page (Side Menu)"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => AboutPage()
                    )
                );
              },
            ),
            Divider(
              color: Colors.black,
              height: 5,
            ),
            ListTile(
              title: Text("Slivers"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageSlivers()
                    )
                );
              },
            ),
            Divider(
              color: Colors.amber,
              height: 5,
            ),
            ListTile(
              title: Text("Chart"),
              onTap: (){
                Navigator.of(context).pop();
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (BuildContext context) => HomePageCharts()
//                  )
//                );
              Navigator.of(context).pushReplacementNamed("/charts");
              },
            ),
            Divider(
              color: Colors.green,
              height: 5,
            ),
            ListTile(
              title: Text("Maps markers"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageMapsMarkers()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Geolocation"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageGeolocation()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Geocoding"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageGeocoding()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Geocoding firestore"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageGeocodingFirestore()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Animations"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageAnimations()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Gestures"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageGestures()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Delayed Animations"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageDelayedAnimations()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Parenting animations"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageParentingAnimations()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Transforming animations"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageTransformingAnimations()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Value change animations"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageValueChangeAnimations()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Mixing animations with UI"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageMixingAnimations()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("MapBox and polylines"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageMapboxPolylines()
                    )
                );
              },
            ),
            Divider(
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("Markers and polygons"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomePageMarkersPolygons()
                    )
                );
              },
            ),
          ],
        ),
      ),
      body:  Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("Hello")
            )
          ],
        ),
      ),
    );
  }

}
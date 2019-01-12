import 'package:flutter/material.dart';
//import 'package:map_view/map_view.dart';
import 'package:raja_yogan/lessons.dart';
import 'package:raja_yogan/the_lessons/lesson9_charts.dart';

void main()  =>
//  MapView.setApiKey("AIzaSyB3KVsH0QWldXUampPjgIvQKegYjjpxsVo");
  runApp(new MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raja Yogan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/charts": (BuildContext context) => HomePageCharts(),
        "/home": (BuildContext context) => MyHomePage()
      },
//      home: HomePageCharts(),
    );
  }
}
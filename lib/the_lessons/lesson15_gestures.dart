import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 15
// Flutter - Gestures
//link video https://www.youtube.com/watch?v=uLw3FicM6AM&index=22&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageGestures  extends StatefulWidget {
  @override
  HomePageGesturesState createState() => HomePageGesturesState();
}

class HomePageGesturesState extends State<HomePageGestures> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Gestures'),
      ),
      body: Center(
        child: GestureDetector(// InkWell / GestureDetector
          onTap: (){
            print("click");
          },
          onDoubleTap: (){
            print("double");
          },
          child: Container(
            height: 100,
            width: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text("Click me")),
          ),
        ),
      ),
    );
  }
}
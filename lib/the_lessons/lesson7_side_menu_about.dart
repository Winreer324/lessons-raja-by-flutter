import 'package:flutter/material.dart';

//lessons 7
//Flutter - Side menu
//link video https://www.youtube.com/watch?v=fuFdY0-iIPc&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi&index=7

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),
      ),
      body: Container(
        child: Center(child: Text("About"),),
      ),
    );
  }
}

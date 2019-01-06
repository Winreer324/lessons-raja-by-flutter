import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';
import 'package:raja_yogan/the_lessons/lesson7_side_menu_about.dart';

//lessons 8
//Flutter - Slivers
//link video https://www.youtube.com/watch?v=4eflzbjTEkw&index=9&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageSliversState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Slivers"),
//      ),
      body:  CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(Icons.arrow_back),
            pinned: true,// что бы появлялся бар
            title: Text("Sliver Effect"),
            floating: false,//что бы при скроле проподал текст
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network("http://placeimg.com/480/320/any",fit: BoxFit.fill,),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context,index) =>
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
                    ),
                    SizedBox(width: 10,),
                    Text("I am the card content!!!!")
                  ],
                ),
              ),
            )
            ),
          )
        ],
      )
    );
  }
}
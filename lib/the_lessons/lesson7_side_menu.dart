import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';
import 'package:raja_yogan/the_lessons/lesson7_side_menu_about.dart';

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
              title: Text("About Page"),
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
              title: Text("More Page"),
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
              color: Colors.amber,
              height: 5,
            ),
            ListTile(
              title: Text("Third Page"),
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
              color: Colors.green,
              height: 5,
            ),
            ListTile(
              title: Text("Help Page"),
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
              color: Colors.purple,
              height: 5,
            ),
            ListTile(
              title: Text("About Page"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => AboutPage()
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
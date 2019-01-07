import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 19
// Flutter - Value Change  Animations
//link video https://www.youtube.com/watch?v=9vkXet7xqLI&index=27&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageValueChangeAnimationsState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 5500),vsync: this);

    animation = IntTween(begin: 200, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Value Change Animations'),
          ),
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Loading..."),
                  Text(animation.value.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60),)
                ],
              ),
            )
          ),
        );
      }
    );
  }
}
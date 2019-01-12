import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 18
// Flutter - Transforming  Animations
//link video https://www.youtube.com/watch?v=JcbF1E6B0CI&index=26&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageTransformingAnimations  extends StatefulWidget {
  @override
  HomePageTransformingAnimationsState createState() => HomePageTransformingAnimationsState();
}

class HomePageTransformingAnimationsState extends State<HomePageTransformingAnimations> with SingleTickerProviderStateMixin{
  Animation animation, transA;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 2000),vsync: this);

    animation = Tween(begin: 10.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));

    transA = BorderRadiusTween(
        begin: BorderRadius.circular(150.0),
        end: BorderRadius.circular(0)
    ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeIn
    ));


    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Transforming Animations'),
          ),
          body: Center(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: animation.value,
                    height: animation.value,
                    decoration: BoxDecoration(
                        borderRadius: transA.value,
                      image: DecorationImage(
                          image: AssetImage("assets/bill_up_close.jpg")
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
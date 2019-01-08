import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 20
// Flutter - Mixing animations with UI
//link video https://www.youtube.com/watch?v=OVM8nlemVEs&index=28&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageMixingAnimationsState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 500),vsync: this);

    animation = Tween(begin: 0, end: -0.20).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Mixing animations with UI'),
          ),
          body: Center(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text("Buy"),
                          elevation: 7,
                          color: Colors.red,
                          textColor: Colors.white,
                          onPressed: (){}
                        ),
                        RaisedButton(
                            child: Text("Details"),
                            elevation: 7,
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: (){}
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage("assets/catlove.jpg"),fit: BoxFit.cover)
                      ),
                      transform: Matrix4.translationValues(0.0, animation.value * width, 0.0),
                    ),
                    onTap: (){
                      animationController.forward();
                    },
                    onDoubleTap: (){
                      animationController.reverse();
                    },
                  ),
                )
              ],
            )
          ),
        );
      }
    );
  }
}
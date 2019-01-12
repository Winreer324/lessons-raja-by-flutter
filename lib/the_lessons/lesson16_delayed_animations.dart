import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 16
// Flutter - Delayed Animations
//link video https://www.youtube.com/watch?v=yVTjoy9sK1k&index=24&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageDelayedAnimations  extends StatefulWidget {
  @override
  HomePageDelayedAnimationsState createState() => HomePageDelayedAnimationsState();
}

class HomePageDelayedAnimationsState extends State<HomePageDelayedAnimations> with SingleTickerProviderStateMixin{
  Animation animation, delayedA, muchDelayedA;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 2500),vsync: this);

    animation = Tween(begin: -1.0,end: 0.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.fastOutSlowIn
    ));

    delayedA =  Tween(begin: -1.0,end: 0.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.5, 1,curve: Curves.fastOutSlowIn)
    ));

    muchDelayedA =  Tween(begin: -1.0,end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.75, 1,curve: Curves.fastOutSlowIn)
        ));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child){
          return Scaffold(
              appBar: AppBar(
              title: Text('Delayed Animations'),
            ),
            body: Align(
              alignment: Alignment.center,
              child: Container(
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
//                    1
                      Transform(
                        transform: Matrix4.translationValues(animation.value *width, 0, 0),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              children: <Widget>[
                                Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
//                    2
                      Transform(
                        transform: Matrix4.translationValues(delayedA.value *width, 0, 0),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(hintText: "UserName"),
                                  obscureText: true,
                                ),
                                SizedBox(height: 10,),
                                TextField(
                                  decoration: InputDecoration(hintText: "Password"),
                                  obscureText: true,
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                        ),
                      ),
//                    3
                      Transform(
                        transform: Matrix4.translationValues(muchDelayedA.value *width, 0, 0),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              children: <Widget>[
                                RaisedButton(
                                    child: Text("Login"),
                                    color: Colors.lightBlue,
                                    elevation: 7,
                                    textColor: Colors.white,
                                    onPressed: (){

                                    }
                                ),
                                SizedBox(height: 10,),
                                Text("Don't have account?"),
                                SizedBox(height: 20,),
                                OutlineButton(
                                    child: Text("Signup"),
                                    color: Colors.lightGreen,
                                    textColor: Colors.green,
                                    borderSide: BorderSide(
                                        color: Colors.green,
                                        style: BorderStyle.solid,
                                        width: 4
                                    ),
                                    onPressed: (){}
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          );
        }
    );
  }
}
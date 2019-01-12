import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 14
// Flutter - Animations
//link video https://www.youtube.com/watch?v=VFSQeLOP504&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi&index=20

class HomePageAnimations  extends StatefulWidget {
  @override
  HomePageAnimationsState createState() => HomePageAnimationsState();
}

class HomePageAnimationsState extends State<HomePageAnimations> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 2000),vsync: this);

    animation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn
    ));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child){
          return Scaffold(
              appBar: AppBar(
              title: Text('Animations'),
            ),
            body: Transform(
                transform: Matrix4.translationValues(animation.value *width, 0, 0),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: <Widget>[
                        Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        TextField(
                          decoration: InputDecoration(hintText: "UserName"),
                          obscureText: true,
                        ),
                        SizedBox(height: 15,),
                        TextField(
                          decoration: InputDecoration(hintText: "Password"),
                          obscureText: true,
                        ),
                        SizedBox(height: 20,),
                        RaisedButton(
                          child: Text("Login"),
                          color: Colors.lightBlue,
                          elevation: 7,
                          textColor: Colors.white,
                          onPressed: (){

                          }
                        ),
                        SizedBox(height: 20,),
                        Text("Don't have account?"),
                        SizedBox(height: 20,),
                        OutlineButton(
                            child: Text("Sign Up"),
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
          );
        }
    );
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Animations'),
//      ),
//      body: Text("lol"),
//    );
  }
}
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 17
// Flutter - Parenting Animations
//link video https://www.youtube.com/watch?v=CfgftDXeigo&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi&index=25

class HomePageParentingAnimationsState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation animation, childA;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 2000),vsync: this);

    animation = Tween(begin: -0.15,end: 0.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeIn
    ));

    childA =  Tween(begin: 20.0,end: 125.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.easeIn
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
              title: Text('Parenting Animations'),
            ),
            body: Align(
              alignment: Alignment.center,
              child: Container(
                child: Transform(
                  transform: Matrix4.translationValues(animation.value *width, 0, 0),
                  child: Center(
                    child: AnimatedBuilder(
                      animation: childA,
                      builder: (BuildContext context, Widget child){
                        return Center(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: childA.value *3,
                            width: childA.value *2,
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                SizedBox(height: 15,),
                                TextField(
                                  decoration: InputDecoration(hintText: "UserName"),
                                  obscureText: true,
                                ),
                                SizedBox(height: 20,),
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
                                  onPressed: (){ }
                                ),
                                SizedBox(height: 10,),
                                Center(child: Text("Don't have account?")),
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
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          );
        }
    );
  }
}
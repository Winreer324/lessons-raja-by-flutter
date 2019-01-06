import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 6
// Flutter - Input Widgets
//link video https://www.youtube.com/watch?v=1njN6vu5Aag&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi&index=7&t=0s
class HomePageInputState extends State<MyHomePage> {
//  1
  final textController = TextEditingController();
  String inputStr = "";
//  2
  bool enabled = false;
//  3
  bool expanded = false;
//  4
  bool checkBox = false;
//  5
  String radioValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Widgets"),
      ),
      body:  Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//          1 TextField
            TextField(
              decoration: InputDecoration(
                hintText: "Say something"
              ),
              onChanged: (String textInput){
                setState(() {
                  inputStr = textInput;
//                  inputStr = textController.text.length.toString();
                });
              },
              controller: textController,
            ),
            Text(inputStr),
//          2 toggle
            Switch(
              onChanged: (bool val){
                setState(() {
                  enabled = val;
                  print(val);
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
              value: enabled,
            ),
//          3 list
            ExpansionPanelList(
              expansionCallback: (i, bool val){
                setState(() {
                  expanded = !val;
                });
              },
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Hello"),
                  ),
                  headerBuilder: (BuildContext context, bool val ){
                    return Center(
                      child: Text(
                        "Tap on me",
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                  isExpanded: expanded
                ),
              ],
            ),
//          4 Checkbox
          Checkbox(
            onChanged: (bool val){
              setState(() {
                checkBox = val;
              });
            },
            value: checkBox,
            activeColor: Colors.redAccent,
          ),
//        5 radio
          Row(
            children: <Widget>[
              Radio(
                value: "First",
                groupValue: radioValue,
                onChanged: (String val){
                  setState(() {
                    setRadioValue(val);
                  });
                },
                activeColor: Colors.amber,
              ),
              Radio(
                value: "Second",
                groupValue: radioValue,
                onChanged: (String val){
                  setState(() {
                    setRadioValue(val);
                  });
                },
                activeColor: Colors.green,
              ),
              Radio(
                value: "Third",
                groupValue: radioValue,
                onChanged: (String val){
                  setState(() {
                    setRadioValue(val);
                  });
                },
                activeColor: Colors.redAccent[400],
              ),
            ],
          )
          ],
        ),
      ),
    );
  }

  void setRadioValue(String value) {
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }
}
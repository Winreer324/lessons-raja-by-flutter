import 'dart:async';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import 'package:flutter/material.dart';
import 'package:raja_yogan/lessons.dart';

//lessons 9
// Flutter - Charts
//link video https://www.youtube.com/watch?v=uiowrGgvyqA&index=10&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi
// part 2 https://www.youtube.com/watch?v=a0xO1LQ656k&index=11&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi
// part 3 https://www.youtube.com/watch?v=VVj11C-C1HA&index=12&list=PLgGjX33Qsw-EMsLf8TmsYhKOCx2ALZiKi

class HomePageCharts  extends StatefulWidget {
  @override
  HomePageChartsState createState() => HomePageChartsState();
}

class HomePageChartsState extends State<HomePageCharts> {

  final GlobalKey<AnimatedCircularChartState> _chartKey =
  new GlobalKey<AnimatedCircularChartState>();

  final _chartSize = const Size(250.0, 250.0);

  Color labelColor = Colors.blue;

  List<CircularStackEntry> _generateChartData(int min, int second) {
    double temp = second * 0.6;
    double adjustedSeconds = second + temp;

    double tempMin = min * 0.6;
    double adjustedMinutes = min + tempMin;

    Color dialColor = Colors.blue;

    labelColor = dialColor;

    List<CircularStackEntry> data = [
      CircularStackEntry(
        [CircularSegmentEntry(adjustedSeconds, dialColor)])
    ];

    if (min > 0) {
      labelColor = Colors.green;
      data.removeAt(0);
      data.add(CircularStackEntry(
          [CircularSegmentEntry(adjustedSeconds, dialColor)]));
      data.add(CircularStackEntry(
          [CircularSegmentEntry(adjustedMinutes, Colors.green)]));
    }

    return data;
  }

  Stopwatch watch = Stopwatch();
  Timer timer;

  String elapsedTime = '';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      var milliseconds = watch.elapsedMilliseconds;
      int hundreds = (milliseconds / 10).truncate();
      int seconds = (hundreds / 100).truncate();
      int minutes = (seconds / 60).truncate();
      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
        if (seconds > 59) {
          seconds = seconds - (59 * minutes);
          seconds = seconds - minutes;
        }
        List<CircularStackEntry> data = _generateChartData(minutes, seconds);
        _chartKey.currentState.updateData(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("adf"),
//      ),
//      body: Center(
//        child: Text("center"),
//      ),
//    );
    TextStyle _labelStyle = Theme
        .of(context)
        .textTheme
        .title
        .merge(TextStyle(color: labelColor));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text('StopWatch (Charts)'),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(elapsedTime, style: TextStyle(fontSize: 25.0)),
                Container(
                  child: AnimatedCircularChart(
                    key: _chartKey,
                    size: _chartSize,
                    initialChartData: _generateChartData(0, 0),
                    chartType: CircularChartType.Radial,
                    edgeStyle: SegmentEdgeStyle.round,
                    percentageValues: true,
                    holeLabel: elapsedTime,
                    labelStyle: _labelStyle,
                  ),
                ),
                SizedBox(height: 20.0), Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        backgroundColor: Colors.green,
                        onPressed: startWatch,
                        child: new Icon(Icons.play_arrow)),
                    SizedBox(width: 20.0),
                    FloatingActionButton(
                        backgroundColor: Colors.red,
                        onPressed: stopWatch,
                        child: new Icon(Icons.stop)),
                    SizedBox(width: 20.0),
                    FloatingActionButton(
                        backgroundColor: Colors.blue,
                        onPressed: resetWatch,
                        child: new Icon(Icons.refresh)),
                  ],
                ),
                SizedBox(height: 20,),
                OutlineButton(
                  child: Text("Back"),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 4,
                    style: BorderStyle.solid
                  ),
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed("/home");
                  },
                )
              ],
            )
        )
    );
  }

  startWatch() {
    watch.start();
    timer = new Timer.periodic(new Duration(milliseconds: 1000), updateTime);
  }

  stopWatch() {
    watch.stop();
    setTime();
  }

  resetWatch() {
    watch.reset();
    setTime();
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
      List<CircularStackEntry> data = _generateChartData(0, 0);
      _chartKey.currentState.updateData(data);
    });
  }

  transformMilliSeconds(int milliseconds) {
    //Thanks to Andrew
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }
}
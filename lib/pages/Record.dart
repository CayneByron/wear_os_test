import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'dart:async';

class Record extends StatefulWidget {
  const Record({Key key}) : super(key: key);

  @override
  _RecordState createState() => _RecordState();
}



class _RecordState extends State<Record> {
  Map data = {};
  String mode = '';
  String hoursStr = '';
  String minutesStr = '';
  String secondsStr = '';
  // StreamSubscription<int> timerSubscription;
  Timer timer;
  Stopwatch stopwatch;

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    stopwatch.start();
    // re-render every 30ms
    timer = new Timer.periodic(new Duration(milliseconds: 1000), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    mode = data['mode'];

    return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
                child: Center(child: WatchShape(
                    builder: (context, shape, child) {
                      return Column(
                        children: [
                          Text(
                            '${formatTime(stopwatch.elapsedMilliseconds)}',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          Text(
                            'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Text(
                            'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      );
                    }
                ))
            )
        );
  }
}

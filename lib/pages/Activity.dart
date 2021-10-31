import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'dart:async';

class Activity extends StatefulWidget {
  Activity({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool isRecording = false;
  String mode = 'walk';
  IconData activityIcon = Icons.play_arrow_rounded;
  IconData modeIcon = Icons.run_circle;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // print('height: $height px');
    // activityIcon = Icons.pause_rounded;
    // modeIcon = Icons.pedal_bike_rounded;

    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: WatchShape(
              builder: (context, shape, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text(
                    //   'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                    // ),
                    GestureDetector(
                      onTap: () async {
                        // setState(() {
                        //   isRecording = isRecording ? false : true;
                        // });
                        Navigator.pushNamed(context, '/record', arguments: {
                          'mode': mode,
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 3),
                        child: Container(
                          height: 80.0,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.circle,
                                        // color: Color(0x66000000),
                                        color: Colors.red,
                                        size: height / 3,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        isRecording ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: height / 3,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (mode == 'walk') {
                          mode = 'run';
                          modeIcon = Icons.run_circle_rounded;
                        } else if (mode == 'run') {
                          mode = 'bike';
                          modeIcon = Icons.pedal_bike_rounded;
                        } else if (mode == 'bike') {
                          mode = 'swim';
                          modeIcon = Icons.pool_rounded;
                        } else {
                          mode = 'walk';
                          modeIcon = Icons.directions_walk_rounded;
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: height / 3 / 2,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.circle,
                                      color: Color(0x66000000),
                                      size: height / 3 / 2,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      modeIcon,
                                      color: Colors.green,
                                      size: height / 3 / 2,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              // child: AmbientMode(
              //   builder: (context, mode, child) {
              //     return Text(
              //       'Mode: ${mode == WearMode.active ? 'Active' : 'Ambient'}',
              //     );
              //   },
              // ),
            ),
          ),
        ),
      );
  }
}

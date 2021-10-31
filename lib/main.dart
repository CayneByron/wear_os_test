import 'package:exampletest123/pages/Record.dart';
import 'package:flutter/material.dart';
import 'package:exampletest123/pages/Activity.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Activity(),
    '/record': (context) => Record(),
  },
));
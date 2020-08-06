import 'package:flutter/material.dart';
import 'package:time_around_world/pages/loading.dart';
import 'package:time_around_world/pages/select_location.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => SelectLocation(),
    },
  ));
}


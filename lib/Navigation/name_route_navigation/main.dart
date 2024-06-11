import 'package:first/Navigation/name_route_navigation/screen/first_screen.dart';
import 'package:first/Navigation/name_route_navigation/screen/second_screen.dart';
import 'package:first/Navigation/name_route_navigation/screen/third_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Name route',
      initialRoute: '/',
      routes: {
          '/': (context) => firstScreen(),
      '/second': (context) => secondScreen(),
      '/third': (context) => thirdScreen()
      },
    );
  }
}

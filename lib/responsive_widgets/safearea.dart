import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Area Widget',
      home: Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
          top: true,
          child: Container(
            child: Text(
              'Hello World',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}

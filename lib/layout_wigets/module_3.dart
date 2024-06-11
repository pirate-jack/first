import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.blue,
                  height: 170,
                  width: 170,
                ),
                Container(
                  color: Colors.deepPurple,
                  height: 170,
                  width: 170,
                ),
                Container(
                  color: Colors.amber,
                  height: 170,
                  width: 170,
                ),
                Container(
                  color: Colors.cyan,
                  height: 170,
                  width: 170,
                ),
                Container(
                  color: Colors.redAccent,
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: Colors.deepPurple,
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: Colors.yellow,
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: Colors.pinkAccent,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

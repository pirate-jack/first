import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Builder',
      home: ListView_Builder(),
    );
  }
}

class ListView_Builder extends StatelessWidget {


  List<Color> colurList = [
  Colors.deepPurple.shade100,
  Colors.deepPurple.shade200,
  Colors.deepPurple.shade300,
  Colors.deepPurple.shade400,
  Colors.deepPurple.shade500,
  Colors.deepPurple.shade600,
  Colors.deepPurple.shade700,
  Colors.deepPurple.shade800,
  Colors.deepPurple.shade900,
  Colors.deepPurple,
  ];

  Color getRandomColor(){
    var index = Random().nextInt(colurList.length);
    return colurList[index];
  }
  ListView_Builder({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Builder'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: getRandomColor(),
            leading: Icon(Icons.tablet_mac_rounded),
            title: Text('Test $index'),
          );
        },
      ),
    );
  }
}

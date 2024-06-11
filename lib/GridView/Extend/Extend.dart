import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Extend(),
    );
  }
}

class Extend extends StatefulWidget {
  const Extend({super.key});

  @override
  State<Extend> createState() => _ExtendState();
}

class _ExtendState extends State<Extend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 1,
        children: [
          Container(
            color: Colors.yellow,
            child: Text('hii'),
          )
        ],
      ),
    );
  }
}

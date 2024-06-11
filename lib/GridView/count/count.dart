import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Count(),
    );
  }
}

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body:GridView.count(crossAxisCount: 2,children: [
        Card(
          color: Colors.lightBlue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("HI MY NAME IS KRIS"),
              )
            ],
          ),
        ),
        Card(
          color: Colors.lightBlue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("HI MY NAME IS KRIS"),
              )
            ],
          ),
        ),
        Card(
          color: Colors.lightBlue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("HI MY NAME IS KRIS"),
              )
            ],
          ),
        ),
        Card(
          color: Colors.lightBlue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("HI MY NAME IS KRIS"),
              )
            ],
          ),
        ),
        Card(
          color: Colors.lightBlue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("HI MY NAME IS KRIS"),
              )
            ],
          ),
        )
      ],)
    );
  }
}


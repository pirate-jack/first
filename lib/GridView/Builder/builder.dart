import 'package:flutter/material.dart';

import 'model/itemModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Bilder(),
    );
  }
}

class Bilder extends StatefulWidget {


  @override
  State<Bilder> createState() => _BilderState();
}

class _BilderState extends State<Bilder> {
  List<Item> itemList = [
    Item(text: "He'd have you all unravel at the", color: Colors.teal.shade100),
    Item(text: "Heed not the rabble", color: Colors.teal.shade200),
    Item(text: "Sound of screams but the", color: Colors.teal.shade300),
    Item(text: "Sound of screams but the", color: Colors.teal.shade400),
    Item(text: "He'd have you all unravel at the", color: Colors.teal.shade500),
    Item(text: "He'd have you all unravel at the", color: Colors.teal.shade600),
    Item(text: "He'd have you all unravel at the", color: Colors.teal.shade700),
    Item(text: "He'd have you all unravel at the", color: Colors.teal.shade800),
    Item(text: "He'd have you all unravel at the", color: Colors.teal.shade900),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4/3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent:200
          ),
          itemCount: itemList.length,
          itemBuilder: (context, index) => Container(
            child: Text(itemList[index].text),
            color: itemList[index].color,
          ),
        ));
  }
}

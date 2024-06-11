import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couter',
      debugShowCheckedModeBanner: false ,
      home: Couter(),
    );
  }
}

class Couter extends StatefulWidget {
  const Couter({super.key});

  @override
  State<Couter> createState() => _CouterState();
}

class _CouterState extends State<Couter> {
  int couter = 0;
  double fontSize = 18;
  Color selectedColor = Colors.red;


  List<Color> Colorlist = [
    Colors.lightBlue,
    Colors.pinkAccent,
    Colors.deepPurpleAccent,
    Colors.tealAccent
  ];

  void increment() {
    setState(() {
      couter++;
      fontSize += 3;
    });
  }

  void decrement() {
    setState(() {
      couter--;
      fontSize -= 3;
    });
  }
  void rendomColor(){
    var index = Random().nextInt(Colorlist.length);
    setState(() {
selectedColor = Colorlist[index];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    decrement();
                  },
                  child: Text('-'),
                ),
                Text('$couter',style: TextStyle(
                  fontSize: fontSize,
                ),),
                ElevatedButton(
                  onPressed: () {
                    increment();
                  },
                  child: Text('+'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              rendomColor();
            }, child: Text('Change Background'))
          ],
        ),
      ),
    );
  }
}

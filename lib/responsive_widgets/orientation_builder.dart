import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MediaQuery (Orientation)', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var boxWidth = MediaQuery.of(context).size.width * 0.5 -
        MediaQuery.of(context).viewPadding.top -
        MediaQuery.of(context).viewPadding.bottom;
    var boxHeight = MediaQuery.of(context).size.height * 0.5 -
        MediaQuery.of(context).viewPadding.top -
        MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildLayout(boxHeight))
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildLayout(boxWidth),
            );
          },
        ),
      ),

    );
  }
}

buildLayout(double boxSize) {
  return [
    Container(
      color: Colors.red,
      width: boxSize,
      height: boxSize,
    ),
    Container(
      color: Colors.green,
      width: boxSize,
      height: boxSize,
    ),
  ];
}

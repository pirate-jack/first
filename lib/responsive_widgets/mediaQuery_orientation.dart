import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MediaOrientation(),
    );
  }
}

class MediaOrientation extends StatefulWidget {
  const MediaOrientation({super.key});

  @override
  State<MediaOrientation> createState() => _MediaOrientationState();
}

class _MediaOrientationState extends State<MediaOrientation> {
  @override
  Widget build(BuildContext context) {
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    var boxwidth = MediaQuery.of(context).size.width * .5 -
        MediaQuery.of(context).viewPadding.top -
        MediaQuery.of(context).viewPadding.bottom;

    var boxheigth = MediaQuery.of(context).size.height * .5 -
        MediaQuery.of(context).viewPadding.top -
        MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      body: Center(
        child: Container(
          child: screenOrientation == Orientation.portrait ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildLayout(boxheigth),
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildLayout(boxwidth),
          )
        ),
      ),
    );
  }

}
buildLayout(double boxsize) {
  return [
    Container(
      height: boxsize,
      width: boxsize,
      color: Colors.blueAccent,
    ),
    Container(
      height: boxsize,
      width: boxsize,
      color: Colors.deepOrange,
    )
  ];
}
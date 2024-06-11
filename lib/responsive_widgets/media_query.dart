import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MediaQuery1(),
    );
  }
}
class MediaQuery1 extends StatefulWidget {
  const MediaQuery1({super.key});

  @override
  State<MediaQuery1> createState() => _MediaQuery1State();
}

class _MediaQuery1State extends State<MediaQuery1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width:size.width/2,
          height: size.height*0.5,
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child: Text('''
          Screen height : ${size.height.toInt()},
          Screen width : ${size.width.toInt()},
          ''',style: TextStyle(
            fontSize: size.width/60
          ),),
        ),
      ),
    );
  }
}

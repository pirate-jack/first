import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imgurl =
        'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?auto=compress&cs=tinysrgb&w=600';
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
          // child: Image.network(
          //   imgurl,
          //   colorBlendMode: BlendMode.darken,
          //   fit: BoxFit.fill
          // ),
        ),
        // body: Center(
        //   child: Container(
        //     height: 400,
        //     width: 400,
        //     color: Colors.deepPurpleAccent,
        //     child: Image.network(
        //       imgurl,
        //       fit: BoxFit.fitWidth,
        //
        //         ),
        //       ),
        //     ),
        //   ),
        // );
      ),
    );
  }
}

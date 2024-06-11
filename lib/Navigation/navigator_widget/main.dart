import 'package:first/Navigation/navigator_widget/screen/first_page.dart';
import 'package:first/Navigation/navigator_widget/screen/second_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: firstpage(),
    );
  }
}

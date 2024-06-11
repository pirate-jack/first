
import 'package:first/http_request/xampp_http/view/studentListShow.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ShowStudentList(),
    );
  }
}

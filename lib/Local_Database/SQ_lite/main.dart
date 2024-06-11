import 'package:first/ListView/ListView_CRUD/model/user.dart';
import 'package:first/Local_Database/SQ_lite/data_base/db_helper.dart';
import 'package:first/Local_Database/SQ_lite/screen/user_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ShowList(),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class Person with ChangeNotifier{

  String name;
  int age;

  Person({required this.name, required this.age});
  void grow() {
    age++;
    notifyListeners();
  }

  void updateName() {
    int index = Random().nextInt(_nameList.length);
    name = _nameList[index];
    notifyListeners();
  }

  List<String> _nameList = [
    'Kris',
    'Nikhil',
    'Mitul',
    'Denish',
    'Keyur',
    'Dhruv',
    'Parash'
  ];
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String name= '';
  String email= '';
  String password= '';
@override
  void initState() {
        super.initState();
        loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: [
            Text('''
            Name: $name
            Email: $email
            Password: $password
            '''),
          ],
        ),
      ),
    );
  }
  Future<void> loadData() async {
    SharedPreferences pref =await  SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('NAME')??'';
      email = pref.getString('EMAIL')??'';
      password = pref.getString('PASSWORD')??'';
    });
  }

}


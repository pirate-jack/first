import 'package:first/Local_Database/SharedPreferences/session_management/preference/pref_manage.dart';
import 'package:first/Local_Database/SharedPreferences/session_management/screen/login.dart';
import 'package:flutter/material.dart';

class HomeData extends StatefulWidget {
  const HomeData({super.key});

  @override
  State<HomeData> createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  bool st = false;
  void status(bool st, BuildContext context) {
    st = !st;
    PrefManage.setLoginStatus(st);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            status(st, context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ));
          },
          child: Text('LogOut'),
        ),
      ),
    );
  }
}

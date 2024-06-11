import 'dart:async';
import 'package:first/Local_Database/SharedPreferences/session_management/preference/pref_manage.dart';
import 'package:first/Local_Database/SharedPreferences/session_management/screen/homeScreen.dart';
import 'package:first/Local_Database/SharedPreferences/session_management/screen/login.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefManage.inti();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      if (PrefManage.getLoginStatus()) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeData(),
            ),
            (route) => false);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/gmail.png')),
    );
  }
}

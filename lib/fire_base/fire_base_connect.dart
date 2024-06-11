import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/fire_base/screen/login.dart';
import 'package:first/fire_base/screen/signup.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: Platform.isAndroid
              ? "AIzaSyDIZktwtFqTxkGm5Yy7XrQgofAaHEPFO08"
              : 'AIzaSyB_Q3gUVNEXA1JD4VZ5TjjO0bBUTcTTUqY',
          appId: "1:256227047071:android:cb502307f9785761db94aa",
          messagingSenderId: "256227047071",
          projectId: "tops-firebase-c4f30",
          storageBucket: "tops-firebase-c4f30.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SignUp(),

    );
  }
}

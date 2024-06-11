import 'package:first/Navigation/on_genrateRoute/route/app_route.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Name route',
      initialRoute: App_Routegenrate.firstroute,
      onGenerateRoute: App_Routegenrate.onGenerateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import '../model_class/model.dart';
import '../screen/first_Route.dart';
import '../screen/second_Route.dart';
import '../screen/third_Route.dart';

class App_Routegenrate {
  static const firstroute = '/';
  static const secondroute = '/Second';
  static const thirdroute = '/third';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstroute:
        return MaterialPageRoute(
          builder: (context) => FirstRoute(),
        );

      case secondroute:
        Employee1? args = settings.arguments as Employee1;
        return MaterialPageRoute(
          builder: (context) => SecondRoute(
            employee: args,
          ),
        );

      case thirdroute:
        Employee1? args = settings.arguments as Employee1;
        return MaterialPageRoute(
          builder: (context) => ThirdRoute(
            employee: args,
          ),
        );
    }
  }
}

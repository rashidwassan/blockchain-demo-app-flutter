import 'package:blockchain_demo_flutter/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import '/pages/homepage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(builder: ((context) => const HomePage()));
    }
  }
}

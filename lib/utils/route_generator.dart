import 'package:blockchain_demo_flutter/pages/demos/hash_page.dart';
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
      case HashPage.routeName:
        return MaterialPageRoute(builder: (_) => const HashPage());

      default:
        return MaterialPageRoute(builder: ((context) => const HomePage()));
    }
  }
}

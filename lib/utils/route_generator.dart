import 'package:blockchain_demo_flutter/pages/demos/blockchain.dart';
import 'package:flutter/material.dart';

import '/pages/demos/hash_page.dart';
import '/pages/homepage.dart';
import '/pages/splash_screen.dart';
import '../pages/demos/block.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case BlockPage.routeName:
        return MaterialPageRoute(builder: (_) => const BlockPage());
      case HashPage.routeName:
        return MaterialPageRoute(builder: (_) => const HashPage());
      case BlockChainDemoPage.routeName:
        return MaterialPageRoute(builder: (_) => const BlockChainDemoPage());

      default:
        return MaterialPageRoute(builder: ((context) => const HomePage()));
    }
  }
}

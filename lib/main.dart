import 'package:blockchain_demo_flutter/pages/splash_screen.dart';
import 'package:blockchain_demo_flutter/utils/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BlockchainDemo());
}

class BlockchainDemo extends StatelessWidget {
  const BlockchainDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blockchain Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF716b94),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}

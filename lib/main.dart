import 'package:flutter/material.dart';

import '/pages/homepage.dart';

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
      home: const HomePage(),
    );
  }
}

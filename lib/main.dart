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
      title: 'Blockchain Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
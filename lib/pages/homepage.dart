import 'package:flutter/material.dart';

import '../utils/crypto_things.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockchain Demo'),
      ),
      body: Center(
        child: Text(
          'SHA256: ${CryptoUtils.getSHA256('Hello World')}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

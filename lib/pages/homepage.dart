import 'package:blockchain_demo_flutter/models/hash_with_nonce.dart';
import 'package:flutter/material.dart';

import '../utils/crypto_things.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    final HashWithNonce hashWithNonce =
        CryptoUtils.getSHA256WithDifficulty(data: 'Hello World', difficulty: 4);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockchain Demo'),
      ),
      body: Center(
        child: Text(
          'SHA256: ${hashWithNonce.hash}\nNonce: ${hashWithNonce.nonce}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class HomePageGridVew extends StatelessWidget {
  const HomePageGridVew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

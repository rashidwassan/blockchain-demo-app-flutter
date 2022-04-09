import 'package:flutter/material.dart';

import '../../models/hash_with_nonce.dart';
import '../../utils/crypto_things.dart';

class HashPage extends StatelessWidget {
  const HashPage({Key? key}) : super(key: key);

  static const String routeName = '/hash';

  @override
  Widget build(BuildContext context) {
    final HashWithNonce hashWithNonce =
        CryptoUtils.getSHA256WithDifficulty(data: 'Hello World', difficulty: 4);
    return Scaffold(
        appBar: AppBar(title: const Text('Hash Page')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
              child: Column(
            children: [
              TextField(),
            ],
          )),
        ));
  }
}

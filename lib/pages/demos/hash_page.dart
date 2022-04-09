import 'package:flutter/material.dart';

import '../../utils/crypto_things.dart';

class HashPage extends StatefulWidget {
  HashPage({Key? key}) : super(key: key);

  static const String routeName = '/hash';

  @override
  State<HashPage> createState() => _HashPageState();
}

class _HashPageState extends State<HashPage> {
  final TextEditingController _contentController = TextEditingController();
  String hash = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Hash Page')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
              child: Column(
            children: [
              TextField(
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Data',
                ),
                onChanged: (value) {
                  _contentController.text = value;
                  setState(() {
                    hash = CryptoUtils.getSHA256(_contentController.text);
                  });
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Text('Hash: $hash'),
            ],
          )),
        ));
  }
}

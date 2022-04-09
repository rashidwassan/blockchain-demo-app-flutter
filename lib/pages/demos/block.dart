import 'package:blockchain_demo_flutter/components/data_input_fields.dart';
import 'package:blockchain_demo_flutter/models/hash_with_nonce.dart';
import 'package:flutter/material.dart';

import '../../utils/crypto_things.dart';

class BlockPage extends StatefulWidget {
  const BlockPage({Key? key}) : super(key: key);

  static const String routeName = '/block';

  @override
  State<BlockPage> createState() => _HashPageState();
}

class _HashPageState extends State<BlockPage> {
  final TextEditingController _contentController = TextEditingController();
  HashWithNonce _hashWithNonce = HashWithNonce('', 1);
  int difficulty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Block')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.teal, borderRadius: BorderRadius.circular(8)),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Text(
                  'Nonce: ${_hashWithNonce.nonce.toString()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Enter the content of the block',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 12,
              ),
              DataInputField(
                  title: 'Data',
                  controller: _contentController,
                  onChanged: (value) {
                    setState(() {
                      _hashWithNonce = CryptoUtils.getSHA256WithDifficulty(
                        data: _contentController.text,
                        difficulty: difficulty,
                      );
                    });
                  }),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Hash:\n${_hashWithNonce.hash}',
                textAlign: TextAlign.center,
              ),
            ],
          )),
        ));
  }
}

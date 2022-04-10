import 'package:blockchain_demo_flutter/components/data_input_fields.dart';
import 'package:flutter/material.dart';

import '../../utils/crypto_things.dart';

class HashPage extends StatefulWidget {
  const HashPage({Key? key}) : super(key: key);

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
        appBar: AppBar(title: const Text('Hash')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              DataInputField(
                  title: 'Data',
                  controller: _contentController,
                  onChanged: (value) {
                    setState(() {
                      hash = CryptoUtils.getSHA256(_contentController.text);
                    });
                  }),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 0.2, color: Colors.black)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Hash',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SelectableText(
                      '\n$hash',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}

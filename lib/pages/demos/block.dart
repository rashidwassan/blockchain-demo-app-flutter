import 'package:blockchain_demo_flutter/components/data_input_fields.dart';
import 'package:blockchain_demo_flutter/constants/images.dart';
import 'package:blockchain_demo_flutter/models/hash_with_nonce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/crypto_things.dart';

class BlockPage extends StatefulWidget {
  const BlockPage({Key? key}) : super(key: key);

  static const String routeName = '/block';

  @override
  State<BlockPage> createState() => _HashPageState();
}

class _HashPageState extends State<BlockPage> {
  final TextEditingController _contentController = TextEditingController();
  HashWithNonce _hashWithNonce = HashWithNonce('', 0);
  bool isCalculating = false;
  getHash() async {
    setState(() {
      isCalculating = true;
    });
    await compute(CryptoUtils.getSHA256WithDifficulty, {
      'data': _contentController.text,
      'difficulty': difficulty.toInt(),
    }).then((result) {
      setState(() {
        _hashWithNonce = result;
        isCalculating = false;
      });
    });
  }

  double difficulty = 3;
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
                BlockCard(
                    contentController: _contentController,
                    hashWithNonce: _hashWithNonce),
                const Spacer(),
                const Text(
                  'Difficulty Level',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black, width: 0.1),
                      gradient: LinearGradient(
                          colors: [Colors.red.shade100, Colors.red])),
                  child: Slider(
                      min: 1,
                      max: 10,
                      divisions: 9,
                      value: difficulty,
                      thumbColor: Colors.white,
                      activeColor: Colors.white,
                      label: difficulty.toInt().toString(),
                      onChanged: (v) {
                        setState(() {
                          difficulty = v;
                        });
                      }),
                ),
                const Spacer(),
                isCalculating
                    ? LottieBuilder.asset(Images.blockchain, height: 40)
                    : MaterialButton(
                        minWidth: 180,
                        height: 40,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: getHash,
                        child: const Text(
                          'Mine',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ));
  }
}

class BlockCard extends StatelessWidget {
  const BlockCard(
      {Key? key, required this.contentController, required this.hashWithNonce})
      : super(key: key);
  final HashWithNonce hashWithNonce;
  final TextEditingController? contentController;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.2),
        color: Theme.of(context).primaryColor.withAlpha(40),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                color: Colors.teal[300],
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Text(
              'Nonce: ${hashWithNonce.nonce.toString()}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Data',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),
          DataInputField(
              title: 'Data',
              controller: contentController,
              onChanged: (value) {}),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.2, color: Colors.black)),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Hash',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SelectableText(
                  hashWithNonce.hash,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:blockchain_demo_flutter/constants/images.dart';
import 'package:blockchain_demo_flutter/models/block.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../components/block_card.dart';
import '../../utils/crypto_things.dart';

class BlockPage extends StatefulWidget {
  const BlockPage({Key? key}) : super(key: key);

  static const String routeName = '/block';

  @override
  State<BlockPage> createState() => _HashPageState();
}

class _HashPageState extends State<BlockPage> {
  final TextEditingController _contentController = TextEditingController();
  Block? block;
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
        block = Block(
            hash: result.hash,
            previousHash:
                '0000000000000000000000000000000000000000000000000000000000000000',
            data: 'Initial Data',
            timestamp: TimeOfDay.now().toString(),
            nonce: result.nonce);

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
                  block: block,
                ),
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

import 'package:flutter/material.dart';

class BlockChainDemoPage extends StatefulWidget {
  const BlockChainDemoPage({Key? key}) : super(key: key);

  static const String routeName = '/blockchain';

  @override
  State<BlockChainDemoPage> createState() => _BlockChainDemoPageState();
}

class _BlockChainDemoPageState extends State<BlockChainDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockchain'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          Expanded(
            child: ListView(
              children: [
                // BlockCard(
                //   contentController: null,
                //   hashWithNonce: HashWithNonce('', 1),
                // ),
                // BlockCard(
                //   contentController: null,
                //   hashWithNonce: HashWithNonce('', 1),
                // ),
                // BlockCard(
                //   contentController: null,
                //   hashWithNonce: HashWithNonce('', 1),
                // )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

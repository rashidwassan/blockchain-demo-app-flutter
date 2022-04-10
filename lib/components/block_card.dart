import 'package:flutter/material.dart';

import '../models/block.dart';
import 'data_input_fields.dart';

class BlockCard extends StatelessWidget {
  const BlockCard({Key? key, required this.block}) : super(key: key);
  final Block? block;

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
              'Nonce: ${block!.nonce.toString()}',
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
              // controller: contentController,
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
                  block!.hash,
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

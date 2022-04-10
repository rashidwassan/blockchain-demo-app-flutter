import 'package:flutter/material.dart';

import '../models/block.dart';

class BlockchainBlocksProvider with ChangeNotifier {
  final List<Block> _blocks = [];

  List<Block> get items => _blocks;

  void addItem(Block block) {
    _blocks.add(block);
    notifyListeners();
  }
}

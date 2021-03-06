import 'package:blockchain_demo_flutter/models/homepage_grid_item.dart';
import 'package:blockchain_demo_flutter/pages/demos/block.dart';
import 'package:blockchain_demo_flutter/pages/demos/blockchain.dart';
import 'package:blockchain_demo_flutter/pages/demos/hash_page.dart';
import 'package:flutter/material.dart';

import '../constants/images.dart';

class HomePageItemsProvider with ChangeNotifier {
  final List<HomePageGridItem> _items = [
    HomePageGridItem(
        imagePath: Images.hash,
        title: 'HASH',
        description: 'Calculate hash of a given content',
        screenRoute: HashPage.routeName),
    HomePageGridItem(
        imagePath: Images.block,
        title: 'BLOCK',
        description: 'Mine a new block with given difficulty',
        screenRoute: BlockPage.routeName),
    HomePageGridItem(
        imagePath: Images.blockchainIcon,
        title: 'BLOCKCHAIN',
        description: 'Demonstration of working of a blockchain',
        screenRoute: BlockChainDemoPage.routeName),
  ];

  List<HomePageGridItem> get items => _items;

  void addItem(HomePageGridItem item) {
    _items.add(item);
    notifyListeners();
  }
}

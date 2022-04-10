import 'package:blockchain_demo_flutter/components/homepage_grid_tile.dart';
import 'package:blockchain_demo_flutter/providers/homepage_items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockchain Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: const [
            Text(
              'Demos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            HomePageGridVew(),
          ],
        ),
      ),
    );
  }
}

class HomePageGridVew extends StatelessWidget {
  const HomePageGridVew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageItemsProvider>(
      builder: (context, itemsData, child) => Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.95,
          ),
          itemCount: itemsData.items.length,
          itemBuilder: (context, index) {
            return HomePageGridTile(item: itemsData.items[index]);
          },
        ),
      ),
    );
  }
}

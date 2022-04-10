import 'package:blockchain_demo_flutter/models/homepage_grid_item.dart';
import 'package:flutter/material.dart';

class HomePageGridTile extends StatelessWidget {
  const HomePageGridTile({Key? key, required this.item}) : super(key: key);

  final HomePageGridItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed(item.screenRoute);
        },
        focusElevation: 3,
        hoverElevation: 3,
        elevation: 4,
        animationDuration: const Duration(milliseconds: 100),
        fillColor: Colors.white,
        splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        highlightElevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(item.imagePath)),
              ),
              Text(
                item.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

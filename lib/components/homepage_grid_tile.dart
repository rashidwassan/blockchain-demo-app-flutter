import 'package:blockchain_demo_flutter/models/homepage_grid_item.dart';
import 'package:flutter/material.dart';

class HomePageGridTile extends StatelessWidget {
  const HomePageGridTile({Key? key, required this.item}) : super(key: key);

  final HomePageGridItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed(item.screenRoute);
        },
        elevation: 4,
        color: Colors.white,
        splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:one_store/data/model/category_model.dart';
import 'homescreen.dart';

class GridItems extends StatelessWidget {
  final int index;

  GridItems(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
          color: Color(0xFFF3B664),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          Image(
            image: AssetImage(
                "assets/image/category/${categoriesGrid[index].imageUrl}"),
          ),
          const SizedBox(height: 19),
          Text(
            categoriesGrid[index].name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

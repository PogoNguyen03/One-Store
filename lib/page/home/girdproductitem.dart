import 'package:flutter/material.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:intl/intl.dart';

class GridProductItems extends StatelessWidget {
  final int index;

  const GridProductItems(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          Image(
            height: 130,
            image:
                AssetImage("assets/image/book/${productsGrid[index].imageUrl}"),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              productsGrid[index].name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            NumberFormat('###,###.###₫').format(productsGrid[index].price),
            style: const TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:one_store/data/model/category_model.dart';
import '../categoryItem/categoryBook/booklistscreen.dart';

class ListItems extends StatelessWidget {
  final int index;

  ListItems(this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookListScreen(
              categoryId: categoriesGrid[index].categoryid,
            ),
          ),
        );
      },
      child: Container(
        width: 120, // Adjust width to make it square
        height: 120, // Adjust height to make it square
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF3B664),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                  "assets/image/category/${categoriesGrid[index].imageUrl}"),
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 5),
            Text(
              categoriesGrid[index].name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../data/model/category_book_model.dart'; // Thay thế bằng tên file chứa model của bạn

class CategoryBookListView extends StatelessWidget {
  final List<CategoryBookModel> categories;

  CategoryBookListView({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45, // Bạn có thể điều chỉnh chiều cao theo ý muốn
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                categories[index].name,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}

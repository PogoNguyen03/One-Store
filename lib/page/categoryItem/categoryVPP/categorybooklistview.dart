import 'package:flutter/material.dart';
import 'package:one_store/data/model/category_officesupplies_model.dart';

class CategoryVPPListView extends StatelessWidget {
  final List<CategoryOfficeSuppliesModel> categories;
  final Function(CategoryOfficeSuppliesModel) onCategorySelected;
  final String selectedCategoryId;

  CategoryVPPListView({
    required this.categories,
    required this.onCategorySelected,
    required this.selectedCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45, // Bạn có thể điều chỉnh chiều cao theo ý muốn
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onCategorySelected(
                  categories[index]); // Gọi hàm callback khi danh mục được nhấn
            },
            child: Container(
              width: 100,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: categories[index].categoryOfficeSuppliesid ==
                        selectedCategoryId
                    ? Color(0xFFF1EB90) // Highlight the selected category
                    : Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  categories[index].name,
                  style: TextStyle(
                    color: categories[index].categoryOfficeSuppliesid ==
                            selectedCategoryId
                        ? Colors
                            .black // Change text color for selected category
                        : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

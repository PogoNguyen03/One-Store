import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:one_store/page/product/productdetailscreen.dart';
import 'package:one_store/data/model/category_book_model.dart';
import 'categorybooklistview.dart';
import 'productgridlistbook.dart';

class BookListScreen extends StatelessWidget {
  final String categoryId;

  BookListScreen({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> filteredProducts = productsGrid
        .where((product) => product.categoryItem == categoryId)
        .toList();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Danh sách sản phẩm'),
      // ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/layout/layout_2.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                // top:
                //     30, // Điều chỉnh vị trí từ top để phù hợp với vị trí của logo
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/image/logo_2.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      Spacer(
                          flex: 1), // Spacer với flex nhỏ để giảm khoảng cách
                      IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.notifications,
                            color: Colors.white),
                        onPressed: () {
                          // Hành động khi nút được nhấn
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top:
                    130, // Điều chỉnh vị trí từ top để phù hợp với vị trí của danh sách danh mục
                left: 0,
                right: 0,
                child: CategoryBookListView(categories: categoryBookGrid),
              ),
              Positioned(
                top:
                    200, // Điều chỉnh vị trí từ top để phù hợp với vị trí của danh sách sản phẩm
                left: 0,
                right: 0,
                bottom: 0,
                child: ProductGrid(products: filteredProducts),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

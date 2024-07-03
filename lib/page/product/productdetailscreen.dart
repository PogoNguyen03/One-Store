import 'package:flutter/material.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:one_store/page/product/favoritebutton.dart';

import '../../data/model/category_book_model.dart';
// import 'package:one_store/globals.dart'; // Import tệp tin toàn cục

class ProductDetail extends StatefulWidget {
  final ProductModel product;

  const ProductDetail(this.product, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // int _selectedIndex = 0;
  // int _cartItemCount = 0;
  // Biến lưu trạng thái yêu thích
  // bool isFavorite = false;
  // Danh sách các sản phẩm yêu thích
  // List<ProductModel> favoriteProducts = [];
  final DatabaseHelper _dbHelper =
      DatabaseHelper(); // Thể hiện của DatabaseHelper
  void addToCart(ProductModel product) {
    _dbHelper.addToCart(product, 1).then((value) {
      // Xử lý sau khi thêm vào giỏ hàng thành công
      if (value > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã thêm vào giỏ hàng'),
            duration: Duration(seconds: 2), // Thời gian hiển thị của SnackBar
          ),
        );
      }
    }).catchError((error) {
      // Xử lý khi có lỗi xảy ra
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/layout/layout_3.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    child: Image.asset(
                      "assets/image/logo_2.png",
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 45,
                    right: 35,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.notifications,
                            color: Color(0xFFFFFFFF)),
                        onPressed: () {
                          // Hành động khi nút được nhấn
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 40,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: const Color(0xFFF3B664),
                          padding: const EdgeInsets.all(15),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.only(top: 200)),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20.0), // Điều chỉnh bán kính bo góc
                          child: Image.asset(
                            "assets/image/book/${widget.product.imageUrl}",
                            fit: BoxFit.cover,
                            height: 250,
                            width: 200,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const TabBar(
                        labelColor: Colors.orange,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Thông tin'),
                          Tab(text: 'Mô tả'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                        child: buildInfoSection(widget.product)),
                    SingleChildScrollView(
                        child: buildDescriptionSection(widget.product)),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(right: 60, left: 60, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FavoriteButton(product: widget.product),
              SizedBox(
                width: 200,
                height: 47,
                child: ElevatedButton(
                  onPressed: () {
                    addToCart(widget
                        .product); // Gọi hàm khi nhấn nút "Thêm vào giỏ hàng"
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Đặt bán kính bo góc là 10.0
                        side: const BorderSide(
                          color: Color(0xFFEC8F5E),
                          width: 2,
                        ), // Viền là màu cam
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Màu nền là màu trắng
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFEC8F5E)), // Màu chữ là màu cam
                  ),
                  child: const Text('Thêm vào giỏ hàng'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoSection(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildInfoRow('Thể loại:', getCategoryBookName(product.categoryBook)),
          buildInfoRow('Tác giả:', product.authorBook),
          buildInfoRow('Năm XB:', product.publishingYear),
          buildInfoRow('Giá bán:', '${product.price} VNĐ', isPrice: true),
          buildInfoRow('Kích thước:', product.sizeBook),
          buildInfoRow('Trọng lượng:', product.weightBook),
        ],
      ),
    );
  }

  Widget buildInfoRow(String title, String value, {bool isPrice = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: isPrice ? Colors.orange : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescriptionSection(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text('Mô tả sản phẩm: Đây là mô tả của sản phẩm ${product.name}.'),
    );
  }

  String getCategoryBookName(String categoryBookId) {
    CategoryBookModel? categoryBook = categoryBookGrid.firstWhere(
      (category) => category.categoryBookid == categoryBookId,
      orElse: () => CategoryBookModel(categoryBookid: '', name: 'Unknown'),
    );
    return categoryBook.name;
  }
}

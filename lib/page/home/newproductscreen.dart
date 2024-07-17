import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:one_store/data/model/category_model.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:one_store/page/product/productdetailscreen.dart';
import 'girdproductitem.dart';
import 'categoryitem.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'panner.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.none,
          child: Container(
            color: Color(0xFFEC8F5E),
            child: Stack(
              children: <Widget>[
                Positioned(
                  // top: 10,
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
                  top: 130,
                  left: 30,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(
                              width: 8), // Khoảng cách giữa icon và dữ liệu
                          const Text(
                            'Trở về',
                            style: TextStyle(
                              color: Colors.white, // Màu chữ
                              fontSize: 16, // Kích thước chữ
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Stack(children: [
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width,
                        //   child: Image.asset(
                        //     "assets/layout/layout_2.png",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        Column(
                          children: <Widget>[
                            const SizedBox(height: 30),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: productsGrid
                                  .length, // Hiển thị tất cả sản phẩm
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetail(productsGrid[index]),
                                      ),
                                    );
                                  },
                                  child: GridProductItems(index),
                                );
                              },
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildImage(String urlImage, int index, BoxFit fit) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 12),
  //     color: Colors.grey,
  //     child: Image.asset(
  //       urlImage,
  //       fit: fit,
  //     ),
  //   );
  // }
}

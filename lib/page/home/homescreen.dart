import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:one_store/data/model/category_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'homescreenwidget.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int carouselIndex = 0; // Index của hình ảnh hiện tại trong carousel
  int navbarIndex = 0; // Index của mục hiện tại trong navbar

  // Danh sách các đường dẫn hình ảnh từ assets
  final List<String> imgList = [
    'assets/image/banner/banner_1.png',
    'assets/image/banner/banner_2.png',
    'assets/image/banner/banner_3.png',
    // Thêm các hình ảnh khác của bạn vào đây
  ];

  // Khai báo navItems
  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home_filled, 'label': 'Home'},
    {'icon': Icons.favorite, 'label': 'Home'},
    {'icon': Icons.search, 'label': 'Search'},
    {'icon': Icons.shopping_bag, 'label': 'Cart'},
    {'icon': Icons.dehaze, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/layout/layout_2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 150, // Đặt top 150px để tạo khoảng cách
                  left: 0,
                  right: 0,
                  child: CarouselSlider.builder(
                    itemCount: imgList.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = imgList[index];
                      return buildImage(urlImage, index, BoxFit.fill);
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          carouselIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 30,
                  child: Image.asset(
                    "assets/image/logo_2.png",
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 60,
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
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: categoriesGrid.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: GridItems(index),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 15.0),
                          child: Text(
                            'Sản phẩm mới',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0, top: 15),
                          child: InkWell(
                            onTap: () {},
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Xem tất cả',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 40,
                      ),
                      itemCount: categoriesGrid.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: GridProductItems(index),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CircleNavBar(
        onTap: (index) {
          setState(() {
            navbarIndex = index;
          });
        },
        height: 60,
        circleWidth: 60,
        activeIndex: navbarIndex,
        circleColor: const Color(0xFFF3B664),
        color: const Color(0xFFEC8F5E),
        activeIcons: List.generate(
            navItems.length, (index) => Icon(navItems[index]['icon'])),
        inactiveIcons: List.generate(navItems.length,
            (index) => Icon(navItems[index]['icon'], color: Colors.white)),
      ),
    );
  }

  Widget buildImage(String urlImage, int index, BoxFit fit) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.asset(
        urlImage,
        fit: fit,
      ),
    );
  }
}

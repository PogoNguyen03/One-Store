import 'package:flutter/material.dart';
import 'package:one_store/data/model/users.dart';
import 'package:one_store/page/cart/cartscreen.dart';
import 'package:one_store/page/favourite/favouritescreen.dart';
import 'package:one_store/page/home/homescreen.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:one_store/page/search/searchscreen.dart';
import 'package:one_store/page/setting/settingScreen.dart';

class Mainpage extends StatefulWidget {
  final Users user; // Thêm trường user

  const Mainpage({Key? key, required this.user}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static List<Widget> _widgetOptions(Users user) => <Widget>[
        HomeScreen(), // Gọi HomeScreen
        FavoritesScreen(),
        SearchScreen(),
        CartScreen(),
        SettingScreen(user: user), // Truyền user vào SettingScreen
        // AccountWidget(), // Uncomment nếu bạn có trang này
      ];

  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home_filled, 'label': 'Home'},
    {'icon': Icons.favorite, 'label': 'Favorite'},
    {'icon': Icons.search, 'label': 'Search'},
    {'icon': Icons.shopping_bag, 'label': 'Cart'},
    {'icon': Icons.dehaze, 'label': 'Setting'},
  ];

  void navigateToHomeScreen() {
    _pageController.jumpToPage(0); // Chuyển đến trang HomeScreen
    setState(() {
      _selectedIndex = 0; // Cập nhật chỉ số activeIndex
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions(widget.user), // Các màn hình hiển thị
      ),
      bottomNavigationBar: CircleNavBar(
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        height: 60,
        circleWidth: 60,
        activeIndex: _selectedIndex,
        circleColor: const Color(0xFFF3B664),
        color: const Color(0xFFEC8F5E),
        activeIcons: List.generate(
            navItems.length, (index) => Icon(navItems[index]['icon'])),
        inactiveIcons: List.generate(navItems.length,
            (index) => Icon(navItems[index]['icon'], color: Colors.white)),
      ),
    );
  }
}

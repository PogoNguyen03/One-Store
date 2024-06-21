import 'package:flutter/material.dart';
import 'package:one_store/page/login/loginscreen.dart';
import 'package:one_store/page/home/homescreen.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // Thay đổi thành HomeScreen
    LoginScreen(),
  ];

  // Khai báo navItems
  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home_filled, 'label': 'Home'},
    {'icon': Icons.favorite, 'label': 'Favorite'},
    {'icon': Icons.search, 'label': 'Search'},
    {'icon': Icons.shopping_bag, 'label': 'Cart'},
    {'icon': Icons.dehaze, 'label': 'Setting'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: CircleNavBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
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
      ),
    );
  }
}

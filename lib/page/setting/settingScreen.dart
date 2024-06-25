import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:one_store/mainpage.dart';
import 'package:one_store/page/setting/addressScreen.dart';
import '../setting/profileUserScreen.dart';
import './changePasswordScreen.dart';

// ignore: camel_case_types
class settingScreen extends StatefulWidget {
  const settingScreen({super.key});

  @override
  State<settingScreen> createState() => _settingScreenState();
}

// ignore: camel_case_types
class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: <Widget>[
      Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/layout/layout_1.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 50,
            right: 50,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/image/logo_2.png",
                          width: 140,
                          height: 140,
                        ),
                        const Positioned(
                          top: 0,
                          child: Icon(
                            Icons.notifications,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Mainpage()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFFF3B664),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      Transform.translate(
        offset: const Offset(0, 50),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const profileUserScreen()));
          },
          child: Transform.translate(
            offset: const Offset(0, 0),
            child: const Stack(
              children: [
                Positioned(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 44,
                      ),
                      Icon(
                        Icons.supervised_user_circle_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 36,
                      ),
                      Text(
                        "Chỉnh sửa thông tin cá nhân",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: const Offset(0, 80),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const changePasswordScreen()));
          },
          child: Transform.translate(
            offset: const Offset(0, 0),
            child: const Stack(
              children: [
                Positioned(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 44,
                      ),
                      Icon(
                        Icons.lock,
                        size: 30,
                      ),
                      SizedBox(
                        width: 36,
                      ),
                      Text(
                        "Đổi mật khẩu",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: const Offset(0, 110),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddressScreen()));
          },
          child: Transform.translate(
            offset: const Offset(0, 0),
            child: const Stack(
              children: [
                Positioned(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 44,
                      ),
                      Icon(
                        Icons.fmd_good_sharp,
                        size: 30,
                      ),
                      SizedBox(
                        width: 36,
                      ),
                      Text(
                        "Địa chỉ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 140),
      const Stack(
        children: [
          Positioned(
            child: Row(
              children: [
                SizedBox(
                  width: 44,
                ),
                Icon(
                  Icons.card_travel_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 36,
                ),
                Text(
                  "Đơn hàng",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 80),
      const Stack(
        children: [
          Positioned(
            child: Row(
              children: [
                SizedBox(
                  width: 44,
                ),
                Icon(
                  Icons.exit_to_app,
                  size: 30,
                ),
                SizedBox(
                  width: 36,
                ),
                Text(
                  "Đăng xuất",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),
      const Stack(
        children: [
          Positioned(
            child: Row(
              children: [
                SizedBox(
                  width: 44,
                ),
                Icon(
                  Icons.delete_outline,
                  size: 30,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 36,
                ),
                Text(
                  "Xóa tài khoản",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 100,
      ),
    ]))));
  }
}

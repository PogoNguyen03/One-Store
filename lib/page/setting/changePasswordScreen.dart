import 'package:flutter/material.dart';
import 'package:one_store/data/model/users.dart';
import './settingScreen.dart';

class ChangePasswordScreen extends StatelessWidget {
  final Users user;
  const ChangePasswordScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/layout/layout_1.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
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
                      Spacer(flex: 1),
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
              Positioned(
                  top: 230,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Mật khẩu cũ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFEC8F5E)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Nhập lại mật khẩu cũ',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFEC8F5E),
                                            width: 1.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Mật khẩu mới",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFEC8F5E)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Nhập mật khẩu mới',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFEC8F5E),
                                            width: 1.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Xác nhận mật khẩu mới",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFEC8F5E)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Nhập lại mật khẩu mới',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFEC8F5E),
                                            width: 1.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Xử lý khi người dùng nhấn vào nút
                              },
                              child: Container(
                                width: 200, // Độ rộng của nút vuông
                                height: 60, // Độ cao của nút vuông
                                decoration: BoxDecoration(
                                    color:
                                        Colors.white, // Màu nền của nút vuông
                                    borderRadius: BorderRadius.circular(
                                        10), // Độ cong góc của nút vuông
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // Độ lệch của bóng đổ
                                      ),
                                    ],
                                    border: Border.all(
                                      color: const Color(0xFFEC8F5E),
                                      width: 1,
                                    )),
                                child: const Center(
                                  child: Text(
                                    'LƯU THAY ĐỔI',
                                    style: TextStyle(
                                      color: Color(
                                          0xFFEC8F5E), // Màu chữ của văn bản
                                      fontSize: 18, // Kích thước chữ
                                      fontWeight:
                                          FontWeight.bold, // Độ đậm của chữ
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

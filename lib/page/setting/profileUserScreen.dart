import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/page/setting/settingScreen.dart';

// ignore: camel_case_types
class profileUserScreen extends StatelessWidget {
  const profileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
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
                                        builder: (context) =>
                                            const settingScreen()));
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    width: 80, // Chiều rộng của Container lớn hơn hình ảnh
                    height: 80, // Chiều cao của Container lớn hơn hình ảnh
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue, // Màu viền
                        width: 3.0, // Độ rộng viền
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/image/image_user.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Transform.translate(
                offset: const Offset(0, -10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chỉnh sửa ảnh",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 30),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Họ tên",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "Bisbis",
                        border: InputBorder.none,
                      ),
                    ))
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 30),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Số điện thoại",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 74,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "0708257865",
                        border: InputBorder.none,
                      ),
                    ))
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 30),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Gmail",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 135,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "bisbis@gmail.com",
                        border: InputBorder.none,
                      ),
                    ))
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 30),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Ngày sinh",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "14/10/2003",
                        border: InputBorder.none,
                      ),
                    ))
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 30),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Giới tính",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 115,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "Nữ",
                        border: InputBorder.none,
                      ),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              GestureDetector(
                onTap: () {
                  // Xử lý khi người dùng nhấn vào nút
                },
                child: Container(
                  width: 200, // Độ rộng của nút vuông
                  height: 60, // Độ cao của nút vuông
                  decoration: BoxDecoration(
                      color: Colors.white, // Màu nền của nút vuông
                      borderRadius: BorderRadius.circular(
                          10), // Độ cong góc của nút vuông
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // Độ lệch của bóng đổ
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
                        color: Color(0xFFEC8F5E), // Màu chữ của văn bản
                        fontSize: 18, // Kích thước chữ
                        fontWeight: FontWeight.bold, // Độ đậm của chữ
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

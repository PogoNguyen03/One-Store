import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/data/model/users.dart';

class ProfileUserScreen extends StatelessWidget {
  final Users user; // Nhận user từ các tham số của widget

  const ProfileUserScreen({Key? key, required this.user}) : super(key: key);

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
                child: Column(
                  children: [
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
                    const SizedBox(height: 10),
                    const Text(
                      "Chỉnh sửa ảnh",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "Họ tên",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "Số điện thoại",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "Gmail",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "Ngày sinh",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "Giới tính",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    "${user.fullname}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    user.phoneNumber ?? "Chưa cập nhật",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    user.gmail ?? "Chưa cập nhật",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "${user.usrBirday ?? "Chưa cập nhật"}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "${user.isDefault ?? "Chưa cập nhật"}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
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
                                offset:
                                    const Offset(0, 3), // Độ lệch của bóng đổ
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Thông tin cá nhân'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text('Họ tên: ${user.fullname}'),
  //           SizedBox(height: 8),
  //           Text('Số điện thoại: ${user.phoneNumber ?? "Chưa cập nhật"}'),
  //           SizedBox(height: 8),
  //           Text('Địa chỉ: ${user.address ?? "Chưa cập nhật"}'),
  //           SizedBox(height: 8),
  //           Text('Email: ${user.gmail ?? "Chưa cập nhật"}'),
  //           SizedBox(height: 8),
  //           Text('Ngày sinh: ${user.usrBirday ?? "Chưa cập nhật"}'),
  //           SizedBox(height: 16),
  //           ElevatedButton(
  //             onPressed: () {
  //               // Xử lý khi nhấn vào nút chỉnh sửa thông tin cá nhân
  //               // Navigator.push(
  //               //   context,
  //               //   MaterialPageRoute(
  //               //     builder: (context) => EditProfileScreen(user: user),
  //               //   ),
  //               // );
  //             },
  //             child: Text('Chỉnh sửa thông tin'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

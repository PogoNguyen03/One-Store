import 'package:flutter/material.dart';
import 'package:one_store/data/model/users.dart';

class ProfileUserScreen extends StatelessWidget {
  final Users user; // Nhận user từ các tham số của widget

  const ProfileUserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin cá nhân'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Họ tên: ${user.usrName}'),
            SizedBox(height: 8),
            Text('Số điện thoại: ${user.phoneNumber ?? "Chưa cập nhật"}'),
            SizedBox(height: 8),
            Text('Địa chỉ: ${user.address ?? "Chưa cập nhật"}'),
            SizedBox(height: 8),
            Text('Email: ${user.gmail ?? "Chưa cập nhật"}'),
            SizedBox(height: 8),
            Text('Ngày sinh: ${user.usrBirday ?? "Chưa cập nhật"}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Xử lý khi nhấn vào nút chỉnh sửa thông tin cá nhân
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EditProfileScreen(user: user),
                //   ),
                // );
              },
              child: Text('Chỉnh sửa thông tin'),
            ),
          ],
        ),
      ),
    );
  }
}

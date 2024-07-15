import 'package:flutter/material.dart';
import 'package:one_store/conf/const.dart';
import 'package:one_store/page/Admin/product/bookmanagement.dart';
import 'package:one_store/page/Admin/product/stationerymanagementpage.dart';
import 'package:one_store/widgets/adminbutton.dart';

class ProductManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý sản phẩm'),
        backgroundColor: buttonBackgroundColor, // Màu nền cam cho AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdminButton(
              imagePath: 'assets/image/admin/book.png',
              label: 'Sách',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookManagementPage(),
                  ),
                );
              },
              textColor: Colors.white, // Màu chữ
              backgroundColor: buttonBackgroundColor, // Màu nền cam
            ),
            SizedBox(height: 20), // Khoảng cách giữa các nút
            AdminButton(
              imagePath: 'assets/image/admin/stationery.png',
              label: 'Văn phòng phẩm',
              onPressed: () {
                // Thêm chức năng cho nút "Văn phòng phẩm"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationeryManagementPage(),
                  ),
                );
              },
              textColor: Colors.white, // Màu chữ
              backgroundColor: buttonBackgroundColor, // Màu nền cam
            ),
          ],
        ),
      ),
    );
  }
}

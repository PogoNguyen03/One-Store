import 'package:flutter/material.dart';
import 'package:one_store/page/home/homescreen.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đặt hàng thành công'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Đơn hàng của bạn đã được đặt thành công!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/', // Route của Mainpage
                  (route) => false, // Loại bỏ tất cả các route khác
                );
              },
              child: Text('Trở về trang chủ'),
            ),
          ],
        ),
      ),
    );
  }
}

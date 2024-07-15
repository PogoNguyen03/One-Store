import 'package:flutter/material.dart';
import 'package:one_store/conf/const.dart';

class AdminButton extends StatelessWidget {
  final String imagePath; // Đường dẫn đến hình ảnh
  final String label;
  final VoidCallback onPressed;
  final Color textColor; // Màu chữ
  final Color backgroundColor; // Màu nền

  AdminButton({
    required this.imagePath,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.white, // Màu chữ mặc định là màu trắng
    this.backgroundColor = buttonBackgroundColor, // Màu nền mặc định là #F3B664
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: backgroundColor, // Áp dụng màu nền cho Card
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Góc tròn (có thể điều chỉnh)
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 150, // Chiều rộng của nút
          height: 150, // Chiều cao của nút để tạo hình vuông
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                ), // Thay thế Icon bằng Image
                SizedBox(height: 16),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: textColor, // Áp dụng màu chữ
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

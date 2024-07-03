import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/users.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final DatabaseHelper databaseHelper = DatabaseHelper();
  bool isConfirming = false;

  @override
  void dispose() {
    phoneNumberController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  Future<void> _confirmPhoneNumber() async {
    String phoneNumber = phoneNumberController.text.trim();

    if (phoneNumber.isEmpty) {
      // Xử lý khi số điện thoại trống
      return;
    }

    bool confirmed = await databaseHelper.confirmPhoneNumber(phoneNumber);

    if (confirmed) {
      setState(() {
        isConfirming = true;
      });
    } else {
      // Xử lý khi số điện thoại không hợp lệ
    }
  }

  Future<void> _updatePassword() async {
    String phoneNumber = phoneNumberController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confirmNewPassword = confirmNewPasswordController.text.trim();

    if (phoneNumber.isEmpty ||
        newPassword.isEmpty ||
        confirmNewPassword.isEmpty) {
      // Xử lý khi có trường rỗng
      return;
    }

    if (newPassword != confirmNewPassword) {
      // Xử lý khi mật khẩu mới và xác nhận mật khẩu không trùng khớp
      return;
    }

    int updated = await databaseHelper.updatePassword(phoneNumber, newPassword);

    if (updated > 0) {
      // Xử lý khi cập nhật mật khẩu thành công
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: const Text('Thay đổi thành công!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Xử lý khi cập nhật mật khẩu thất bại
    }
  }

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
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    "assets/layout/layout_4.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
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
                top: 400,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!isConfirming) ...[
                        Column(
                          children: [
                            const Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Vui lòng nhập số điện thoại đã đăng ký",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: 'Nhập số điện thoại',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFEC8F5E),
                                          width: 1.0,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: _confirmPhoneNumber,
                              child: Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Color(0xFFEC8F5E),
                                    width: 1,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'XÁC NHẬN',
                                    style: TextStyle(
                                      color: Color(0xFFEC8F5E),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ],
                      if (isConfirming) ...[
                        Column(
                          children: [
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
                                    color: Color(0xFFEC8F5E),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: newPasswordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Nhập mật khẩu mới',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFEC8F5E),
                                          width: 1.0,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
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
                                    color: Color(0xFFEC8F5E),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: confirmNewPasswordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Nhập lại mật khẩu mới',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFEC8F5E),
                                          width: 1.0,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            GestureDetector(
                              onTap: _updatePassword,
                              child: Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Color(0xFFEC8F5E),
                                    width: 1,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'LƯU THAY ĐỔI',
                                    style: TextStyle(
                                      color: Color(0xFFEC8F5E),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

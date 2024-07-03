import 'package:flutter/material.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/users.dart';

class ChangePasswordScreen extends StatefulWidget {
  final Users user;

  const ChangePasswordScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isOldPasswordCorrect = false;

  // Khởi tạo một đối tượng DatabaseHelper
  final dbHelper = DatabaseHelper();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkOldPassword(String value) {
    if (value == widget.user.usrPassword) {
      setState(() {
        _isOldPasswordCorrect = true;
      });
    } else {
      setState(() {
        _isOldPasswordCorrect = false;
      });
    }
  }

  void _changePassword(BuildContext context) {
    if (_isOldPasswordCorrect &&
        _newPasswordController.text == _confirmPasswordController.text) {
      // Cập nhật mật khẩu mới vào cơ sở dữ liệu
      dbHelper
          .updatePassword(widget.user.usrName, _newPasswordController.text)
          .then((value) {
        // Hiển thị SnackBar thông báo thành công
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đổi mật khẩu thành công'),
          ),
        );

        // Trở về trang trước đó sau khi hiển thị SnackBar
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      });
    } else {
      // Hiển thị thông báo lỗi nếu mật khẩu không khớp
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mật khẩu không khớp hoặc mật khẩu cũ không đúng'),
        ),
      );
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
                          Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _oldPasswordController,
                                  obscureText: true,
                                  onChanged: _checkOldPassword,
                                  decoration: InputDecoration(
                                    hintText: 'Nhập lại mật khẩu cũ',
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFEC8F5E), width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                    suffixIcon: _isOldPasswordCorrect
                                        ? const Icon(Icons.check,
                                            color: Colors.green)
                                        : null,
                                  ),
                                ),
                              ),
                              const SizedBox(
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
                          Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _newPasswordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Nhập mật khẩu mới',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFEC8F5E), width: 1.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(
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
                          Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Nhập lại mật khẩu mới',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFEC8F5E), width: 1.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          GestureDetector(
                            onTap: () {
                              _changePassword(context);
                            },
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
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                border: Border.all(
                                  color: const Color(0xFFEC8F5E),
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
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      )
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

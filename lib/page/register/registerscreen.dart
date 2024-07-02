import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/page/login/loginscreen.dart';
import '../../data/model/users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:one_store/SQLite/sqlite.dart';

// RegisterScreen
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final username = TextEditingController();
  final fullname = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 70.0, bottom: 16.0, right: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          // Xử lý khi nút đăng ký được nhấn
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130, 20),
                          backgroundColor: const Color(0xFFF3B664),
                        ),
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          // Xử lý khi nút đăng nhập được nhấn
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130, 20),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 100.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'TRỞ THÀNH HỘI VIÊN CỦA ONE STORE  ',
                        style: TextStyle(
                          fontSize: 40,
                          color: Color(0xFFEC8F5E),
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 4.0),
                              blurRadius: 10.0,
                              color: Color.fromARGB(45, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                      WidgetSpan(
                        child: Image.asset('assets/image/iconregister.png'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFEC8F5E),
                          ),
                        ),
                        child: TextFormField(
                          controller: fullname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Không được bỏ trống họ tên";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Họ tên",
                            hintStyle: TextStyle(
                              color: Color(0xFFEC8F5E),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFFEC8F5E),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFEC8F5E),
                          ),
                        ),
                        child: TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Không được bỏ trống tên tài khoản";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Tên tài khoản",
                            hintStyle: TextStyle(
                              color: Color(0xFFEC8F5E),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFFEC8F5E),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFEC8F5E),
                          ),
                        ),
                        child: TextFormField(
                          controller: phoneNumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Không được bỏ trống số điện thoại";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Số điện thoại",
                            hintStyle: TextStyle(
                              color: Color(0xFFEC8F5E),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Color(0xFFEC8F5E),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFEC8F5E),
                          ),
                        ),
                        child: TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Không được để trống mật khẩu";
                            }
                            return null;
                          },
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            hintText: "Mật khẩu",
                            hintStyle: TextStyle(color: Color(0xFFEC8F5E)),
                            border: InputBorder.none,
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xFFEC8F5E)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: Color(0xFFEC8F5E),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFEC8F5E),
                          ),
                        ),
                        child: TextFormField(
                          controller: confirmPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password is required";
                            } else if (password.text != confirmPassword.text) {
                              return "Passwords don't match";
                            }
                            return null;
                          },
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            hintText: "Xác nhận mật khẩu",
                            hintStyle: TextStyle(color: Color(0xFFEC8F5E)),
                            border: InputBorder.none,
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xFFEC8F5E)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: Color(0xFFEC8F5E),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFEC8F5E),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final db = DatabaseHelper();
                              db
                                  .signup(Users(
                                usrName: username.text,
                                fullname: fullname.text,
                                usrPassword: password.text,
                                phoneNumber: phoneNumber.text,
                                usrId: null,
                              ))
                                  .then((userId) {
                                if (userId != -1) {
                                  // Đăng ký thành công, lưu thông tin người dùng vào SharedPreferences
                                  saveUserDataToLocal();
                                  // Chuyển sang màn hình đăng nhập
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                } else {
                                  // Xử lý trường hợp đăng ký không thành công
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Đăng ký không thành công'),
                                    ),
                                  );
                                }
                              }).catchError((error) {
                                print("Error while signing up: $error");
                                // Xử lý lỗi nếu có
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Đăng ký không thành công'),
                                  ),
                                );
                              });
                            }
                          },
                          child: const Text(
                            "ĐĂNG KÝ",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
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

  void saveUserDataToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username.text);
    prefs.setString('fullname', fullname.text);
    prefs.setString('phoneNumber', phoneNumber.text);
  }
}

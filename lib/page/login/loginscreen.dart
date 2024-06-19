import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/page/register/registerscreen.dart';
import 'package:one_store/page/home/homescreen.dart';
// import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isRememberMe = false;
  bool _isHidden = true;
  TextEditingController _password = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool? isRememberMe = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Chiều rộng bằng với màn hình
                    child: Image.asset(
                      "assets/layout/layout_1.png",
                      fit: BoxFit.cover, // Hình ảnh sẽ được kéo giãn để phủ kín
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 50.0, bottom: 16.0, right: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              // Xử lý khi nút đăng nhập được nhấn
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFF3B664)),
                            ),
                            child: const Text(
                              'Đăng nhập',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 15), // Khoảng cách giữa hai nút
                          ElevatedButton(
                            onPressed: () {
                              // Xử lý khi nút đăng ký được nhấn
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            },
                            child: const Text(
                              'Đăng ký',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Image.asset(
                "assets/image/logo_1.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(left: 20, right: 15),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFEC8F5E),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE7EEF8),
                      blurRadius: 1.0,
                      offset: Offset(2.6, 2.6),
                    ),
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Tài khoản",
                      hintStyle: TextStyle(
                        color: Color(0xFFEC8F5E), // Đặt màu cho hint text
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFFEC8F5E),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(left: 20, right: 15),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFEC8F5E),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE7EEF8),
                      blurRadius: 1.0,
                      offset: Offset(2.6, 2.6),
                    ),
                  ],
                ),
                child: Center(
                  child: TextFormField(
                    controller: _password,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      hintText: "Mật khẩu",
                      hintStyle: TextStyle(color: Color(0xFFEC8F5E)),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock, color: Color(0xFFEC8F5E)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isHidden ? Icons.visibility_off : Icons.visibility,
                          color: Color(0xFFEC8F5E),
                        ),
                        onPressed: _toggleVisibility,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0,
                        top: 15.0), // Thêm padding xung quanh radio button
                    child: Radio(
                      value: true,
                      groupValue: isRememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          isRememberMe = value;
                        });
                      },
                      activeColor: const Color(0xFFEC8F5E),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 15), // Thêm padding phía trên cho Text
                    child: Text('Nhớ tôi'),
                  ),

                  const Spacer(), // Sử dụng Spacer để tạo khoảng trống
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30.0,
                        top: 15), // Thêm padding xung quanh InkWell
                    child: InkWell(
                      onTap: () {
                        // Điều hướng đến trang "Tôi quên mật khẩu"
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ForgotPasswordPage()),
                        // );
                      },
                      child: const Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEC8F5E),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFE7EEF8),
                        blurRadius: 1.0,
                        offset: Offset(2.6, 2.6),
                      )
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Đăng nhập",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Đảm bảo bạn đã thêm các asset cho logo Facebook và Google trong pubspec.yaml
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left:
                                  60.0), // Thay đổi giá trị 8.0 để điều chỉnh padding bên trái
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Đăng nhập với',
                            style: TextStyle(fontSize: 16)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right:
                                  60.0), // Thay đổi giá trị 8.0 để điều chỉnh padding bên trái
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // Khoảng cách giữa chữ và nút
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          // Xử lý đăng nhập với Facebook
                        },
                        child: Image.asset(
                          'assets/image/Facebook.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          // Xử lý đăng nhập với Google
                        },
                        child: Image.asset(
                          'assets/image/Google.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

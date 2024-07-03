import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/page/login/loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // const RegisterScreen({super.key});

  bool _isHidden = true;
  TextEditingController _password = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 70.0, bottom: 16.0, right: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Xử lý khi nút đăng nhập được nhấn
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
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
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 0, 0, 0)),
                      ),
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 100.0),
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
                          // Thêm bóng khác nếu cần
                        ],
                      ),
                    ),
                    WidgetSpan(
                        child: Image.asset('assets/image/iconregister.png')),
                    // Thêm WidgetSpan khác cho icon người nếu cần
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
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
                    hintText: "Họ tên",
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
                    hintText: "Nhập lại mật khẩu",
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
                    hintText: "Số điện thoại",
                    hintStyle: TextStyle(
                      color: Color(0xFFEC8F5E), // Đặt màu cho hint text
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Color(0xFFEC8F5E),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
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
                      "Đăng ký",
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
          ],
        ),
      ),
    );
  }
}

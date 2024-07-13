import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:one_store/page/register/registerscreen.dart';
import 'package:one_store/page/login/forgetpass.dart';
import 'package:one_store/mainpage.dart';
import 'package:one_store/data/model/users.dart';
import 'package:one_store/SQLite/sqlite.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isVisible = false;
  bool isLoginTrue = false;
  final db = DatabaseHelper();
  bool isRememberMe = false; // Biến để lưu trạng thái ghi nhớ mật khẩu

  @override
  void initState() {
    super.initState();
    // Kiểm tra và load thông tin đã lưu
    loadSavedCredentials();
  }

  void loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');

    if (savedUsername != null && savedPassword != null) {
      setState(() {
        username.text = savedUsername;
        password.text = savedPassword;
        isRememberMe = true;
      });
    }
  }

  void login() async {
    var response = await db
        .login(Users(usrName: username.text, usrPassword: password.text));
    if (response) {
      // Lưu thông tin tài khoản nếu người dùng chọn "Nhớ tôi"
      if (isRememberMe) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', username.text);
        prefs.setString('password', password.text);
      }

      // Lấy thông tin user từ SQLite
      Users? user = await db.getUserByName(username.text);
      if (user != null) {
        // Điều hướng đến Mainpage và truyền user
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Mainpage(user: user)),
        );
      } else {
        // Xử lý trường hợp không tìm thấy user
        setState(() {
          isLoginTrue = true;
        });
        showAlertDialog(context, "Tài khoản không tồn tại");
      }
    } else {
      setState(() {
        isLoginTrue = true;
      });
      showAlertDialog(context, "Tài khoản hoặc mật khẩu không đúng");
    }
  }

  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Lỗi đăng nhập"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //         top: 50.0, bottom: 16.0, right: 10.0),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: <Widget>[
                  //         ElevatedButton(
                  //           onPressed: () {
                  //             if (formKey.currentState!.validate()) {
                  //               //Login method will be here
                  //               login();
                  //             }
                  //           },
                  //           style: ElevatedButton.styleFrom(
                  //             fixedSize: Size(130, 20), // Đặt kích thước 100x50
                  //             backgroundColor: const Color(0xFFF3B664),
                  //           ),
                  //           child: const Text(
                  //             'Đăng nhập',
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //         const SizedBox(width: 15), // Khoảng cách giữa hai nút
                  //         ElevatedButton(
                  //           onPressed: () {
                  //             // Xử lý khi nút đăng ký được nhấn
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => RegisterScreen()),
                  //             );
                  //           },
                  //           style: ElevatedButton.styleFrom(
                  //             fixedSize: Size(130, 20), // Đặt kích thước 100x50
                  //             backgroundColor:
                  //                 Color.fromARGB(255, 255, 255, 255),
                  //           ),
                  //           child: const Text(
                  //             'Đăng ký',
                  //             style: TextStyle(color: Colors.black),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 30),
              Image.asset(
                "assets/image/logo_1.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(.2),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFEC8F5E),
                        ),
                      ),
                      child: TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Không được để trống tài khoản";
                          }
                          return null;
                        },
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

                    const SizedBox(height: 20),
                    //Password field
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(.2),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFEC8F5E),
                        ),
                      ),
                      child: TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Không được để trống tài khoản";
                          }
                          return null;
                        },
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xFFEC8F5E)),
                            border: InputBorder.none,
                            hintText: "Mật khẩu",
                            hintStyle: TextStyle(color: Color(0xFFEC8F5E)),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  //In here we will create a click to show and hide the password a toggle button
                                  setState(() {
                                    //toggle button
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(
                                  isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xFFEC8F5E),
                                ))),
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 15),
                          child: Checkbox(
                            value: isRememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                isRememberMe = value ?? false;
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()),
                              );
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

                    const SizedBox(height: 10),
                    //Login button
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * .9,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //Login method will be here
                            login();
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Color(0xFFEC8F5E)),
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                        ),
                        child: const Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    Center(
                      child: InkWell(
                        onTap: () {
                          // Điều hướng đến trang "Tôi quên mật khẩu"
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                        child: const Text(
                          'Bạn chưa có tài khoản?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     const Row(
                    //       children: <Widget>[
                    //         Expanded(
                    //           child: Padding(
                    //             padding: EdgeInsets.only(
                    //                 left:
                    //                     60.0), // Thay đổi giá trị 8.0 để điều chỉnh padding bên trái
                    //             child: Divider(
                    //               color: Colors.black,
                    //               thickness: 2,
                    //             ),
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: EdgeInsets.symmetric(horizontal: 8.0),
                    //           child: Text('Đăng nhập với',
                    //               style: TextStyle(fontSize: 16)),
                    //         ),
                    //         Expanded(
                    //           child: Padding(
                    //             padding: EdgeInsets.only(
                    //                 right:
                    //                     60.0), // Thay đổi giá trị 8.0 để điều chỉnh padding bên trái
                    //             child: Divider(
                    //               color: Colors.black,
                    //               thickness: 2,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     // const SizedBox(
                    //     //     height: 10), // Khoảng cách giữa chữ và nút
                    //     // Row(
                    //     //   mainAxisAlignment: MainAxisAlignment.center,
                    //     //   children: <Widget>[
                    //     //     InkWell(
                    //     //       onTap: () {
                    //     //         // Xử lý đăng nhập với Facebook
                    //     //       },
                    //     //       child: Image.asset(
                    //     //         'assets/image/Facebook.png',
                    //     //         width: 100,
                    //     //         height: 100,
                    //     //       ),
                    //     //     ),
                    //     //     const SizedBox(width: 30),
                    //     //     InkWell(
                    //     //       onTap: () {
                    //     //         // Xử lý đăng nhập với Google
                    //     //       },
                    //     //       child: Image.asset(
                    //     //         'assets/image/Google.png',
                    //     //         width: 100,
                    //     //         height: 100,
                    //     //       ),
                    //     //     ),
                    //     //   ],
                    //     // ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:one_store/data/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:one_store/data/model/usermodeladmin.dart';
import 'package:one_store/conf/const.dart';

class UpdateUserPage extends StatefulWidget {
  final User user;

  UpdateUserPage({required this.user});

  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _usernameController = TextEditingController(text: widget.user.username);
    _passwordController = TextEditingController(text: widget.user.password);
    _confirmPasswordController =
        TextEditingController(text: widget.user.password);
    _phoneController = TextEditingController(text: widget.user.phone);
  }

  // void _updateUser() {
  //   if (_formKey.currentState!.validate()) {
  //     final updatedUser = User(
  //       id: widget.user.id,
  //       name: _nameController.text,
  //       username: _usernameController.text,
  //       phone: _phoneController.text,
  //       password: _passwordController.text,
  //     );

  //     Provider.of<UserProvider>(context, listen: false).updateUser(updatedUser);

  //     Navigator.pop(context);
  //   }
  // }

  // void _deleteUser() {
  //   Provider.of<UserProvider>(context, listen: false)
  //       .deleteUser(widget.user.id);
  //   Navigator.pop(context);
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật người dùng'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tên', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Tài khoản', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tài khoản';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Mật khẩu', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Xác nhận mật khẩu',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng xác nhận mật khẩu';
                  }
                  if (value != _passwordController.text) {
                    return 'Mật khẩu không khớp';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Số điện thoại',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonBackgroundColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},//_updateUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBackgroundColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius
                            .zero, // Bán kính bo tròn là 0 để tạo nút vuông
                      ),
                    ),
                    child: Text(
                      'Cập nhật',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {}, //_deleteUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius
                            .zero, // Bán kính bo tròn là 0 để tạo nút vuông
                      ),
                    ),
                    child: Text(
                      'Xóa',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

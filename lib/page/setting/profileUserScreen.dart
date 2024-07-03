import 'package:flutter/material.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/users.dart';
import 'dart:io'; // Thêm thư viện này để làm việc với File
import 'package:image_picker/image_picker.dart';

class ProfileUserScreen extends StatefulWidget {
  final Users user; // Nhận user từ các tham số của widget

  const ProfileUserScreen({super.key, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileUserScreenState createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  late TextEditingController fullnameController;
  late TextEditingController phoneNumberController;
  late TextEditingController gmailController;
  late TextEditingController birthdayController;
  late TextEditingController genderController;

  bool isEditing = false;
  List<String> genders = ['Nam', 'Nữ'];
  String selectedGender = 'Nam'; // Mặc định là 'Nam'
  File? _imageFile; // Biến lưu trữ file hình ảnh đã chọn

  @override
  void initState() {
    super.initState();
    fullnameController =
        TextEditingController(text: widget.user.fullname ?? '');
    phoneNumberController =
        TextEditingController(text: widget.user.phoneNumber ?? '');
    gmailController = TextEditingController(text: widget.user.gmail ?? '');
    birthdayController = TextEditingController(
      text: widget.user.usrBirday != null
          ? widget.user.usrBirday!.toIso8601String().split('T').first
          : '',
    );
    genderController = TextEditingController(
        text: widget.user.isDefault != null
            ? (widget.user.isDefault! ? 'Nữ' : 'Nam')
            : '');
  }

  @override
  void dispose() {
    fullnameController.dispose();
    phoneNumberController.dispose();
    gmailController.dispose();
    birthdayController.dispose();
    genderController.dispose();
    super.dispose();
  }

  Future<void> saveChanges() async {
    setState(() {
      widget.user.fullname = fullnameController.text;
      widget.user.phoneNumber = phoneNumberController.text;
      widget.user.gmail = gmailController.text;
      widget.user.usrBirday = DateTime.tryParse(birthdayController.text);
      widget.user.isDefault = genderController.text.toLowerCase() == 'nữ';

      // isEditing = false;
      if (_imageFile != null) {
        widget.user.usrImage = _imageFile!.path; // Cập nhật đường dẫn ảnh
      }
    });

    // Thêm các xử lý lưu dữ liệu vào cơ sở dữ liệu hoặc API tại đây
    // Gọi phương thức updateUser để lưu dữ liệu vào cơ sở dữ liệu
    await DatabaseHelper().updateUser(widget.user);

    setState(() {
      isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thông tin đã được cập nhật')),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != birthdayController.text) {
      setState(() {
        birthdayController.text = picked.toIso8601String().split('T').first;
      });
    }
    if (picked != null) {
      setState(() {
        birthdayController.text = picked.toIso8601String().split('T').first;
      });
    }
  }

  // Hàm xử lý khi người dùng chọn hình ảnh từ thiết bị
  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      // Xử lý khi người dùng không chọn hình ảnh
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
                      const Spacer(flex: 1),
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
                        GestureDetector(
                          onTap: () {
                            if (isEditing) {
                              _pickImage(); // Chọn hình ảnh từ thư viện khi đang chỉnh sửa
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 4.0,
                              ),
                            ),
                            child: ClipOval(
                              child: _imageFile != null
                                  ? Image.file(_imageFile!, fit: BoxFit.cover)
                                  : widget.user.usrImage != null
                                      ? Image.file(File(widget.user.usrImage!),
                                          fit: BoxFit.cover)
                                      : Image.asset(
                                          "assets/image/icon_user.png", // Đường dẫn đến biểu tượng người dùng trong assets của bạn
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // TextButton(
                        //   onPressed: () {
                        //     setState(() {
                        //       isEditing =
                        //           true; // Khi nhấn vào nút thay đổi, đặt isEditing thành true
                        //     });
                        //   },
                        //   child: const Text(
                        //     "Chỉnh sửa ảnh",
                        //     style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 20, right: 15),
                                    child: Text(
                                      "Họ tên",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, left: 15),
                                    child: isEditing
                                        ? TextField(
                                            controller: fullnameController,
                                            decoration: const InputDecoration(
                                              hintText: "Họ tên",
                                              border: OutlineInputBorder(),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          )
                                        : Text(
                                            widget.user.fullname ??
                                                "Chưa cập nhật",
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 20, right: 15),
                                    child: Text(
                                      "Số điện thoại",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, left: 15),
                                    child: isEditing
                                        ? TextField(
                                            controller: phoneNumberController,
                                            decoration: const InputDecoration(
                                              hintText: "Số điện thoại",
                                              border: OutlineInputBorder(),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          )
                                        : Text(
                                            widget.user.phoneNumber ??
                                                "Chưa cập nhật",
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 20, right: 15),
                                    child: Text(
                                      "Gmail",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, left: 15),
                                    child: isEditing
                                        ? TextField(
                                            controller: gmailController,
                                            decoration: const InputDecoration(
                                              hintText: "Gmail",
                                              border: OutlineInputBorder(),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          )
                                        : Text(
                                            widget.user.gmail ??
                                                "Chưa cập nhật",
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 20,
                                      right: 15,
                                    ),
                                    child: Text(
                                      "Ngày sinh",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 20,
                                      left: 15,
                                    ),
                                    child: isEditing
                                        ? Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      birthdayController,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: "Ngày sinh",
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  // Hiển thị date picker khi nhấn vào icon lịch
                                                  _selectDate(context);
                                                },
                                                icon: const Icon(
                                                    Icons.calendar_today),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            widget.user.usrBirday != null
                                                ? widget.user.usrBirday!
                                                    .toIso8601String()
                                                    .split('T')
                                                    .first
                                                : "Chưa cập nhật",
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 20, right: 15),
                                    child: Text(
                                      "Giới tính",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, left: 15),
                                    child: isEditing
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors
                                                      .black), // Thêm viền xung quanh
                                            ),
                                            child: DropdownButton<String>(
                                              value: selectedGender,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedGender = newValue!;
                                                });
                                              },
                                              items: genders.map<
                                                  DropdownMenuItem<String>>(
                                                (String gender) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: gender,
                                                    child: Text(gender),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          )
                                        : Text(
                                            selectedGender,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isEditing)
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isEditing = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.orange,
                                  backgroundColor: Colors.white, // Màu viền cam
                                  // Các thuộc tính khác (padding, textStyle, ...)
                                ),
                                child: const Text(
                                  'Hủy',
                                  style: TextStyle(
                                    color: Color(
                                        0xFFEC8F5E), // Màu chữ của văn bản
                                    fontSize: 18, // Kích thước chữ
                                    fontWeight:
                                        FontWeight.bold, // Độ đậm của chữ
                                  ),
                                ),
                              ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                if (isEditing) {
                                  saveChanges();
                                } else {
                                  setState(() {
                                    isEditing = true;
                                  });
                                }
                              },
                              child: Container(
                                width: 200, // Độ rộng của nút vuông
                                height: 60, // Độ cao của nút vuông
                                decoration: BoxDecoration(
                                  color: Colors.white, // Màu nền của nút vuông
                                  borderRadius: BorderRadius.circular(
                                      10), // Độ cong góc của nút vuông
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // Độ lệch của bóng đổ
                                    ),
                                  ],
                                  border: Border.all(
                                    color: const Color(0xFFEC8F5E),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    isEditing ? 'LƯU THAY ĐỔI' : 'THAY ĐỔI',
                                    style: const TextStyle(
                                      color: Color(
                                          0xFFEC8F5E), // Màu chữ của văn bản
                                      fontSize: 18, // Kích thước chữ
                                      fontWeight:
                                          FontWeight.bold, // Độ đậm của chữ
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

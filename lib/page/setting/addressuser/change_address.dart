import 'package:flutter/material.dart';
import 'package:one_store/data/model/address_model.dart';
import 'package:one_store/page/setting/addressuser/addressscreen.dart';

class ChangeAddressScreen extends StatefulWidget {
  final Address address;

  const ChangeAddressScreen({Key? key, required this.address})
      : super(key: key);

  @override
  _ChangeAddressScreenState createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  bool isDefault = false;

  @override
  void initState() {
    super.initState();
    isDefault = widget.address.isDefault ?? false;
  }

  void _navigateToAddressScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AddressScreen(),
      ),
    );
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
                          Column(
                            children: [
                              const Row(
                                children: [
                                  SizedBox(width: 31),
                                  Text(
                                    'Liên hệ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4D4A4A),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 1.0,
                                color: Colors.grey[300], // Màu xám nhạt
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0), // Khoảng cách ngang
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  const SizedBox(width: 31),
                                  Text(
                                    '${widget.address.userName}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 1.0,
                                color: Colors.grey[300], // Màu xám nhạt
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0), // Khoảng cách ngang
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  const SizedBox(width: 31),
                                  Text(
                                    '(+84) ${widget.address.phoneNumber}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 1.0,
                                color: Colors.grey[300], // Màu xám nhạt
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0), // Khoảng cách ngang
                              ),
                              const SizedBox(height: 50),
                              const Row(
                                children: [
                                  SizedBox(width: 31),
                                  Text(
                                    'Địa chỉ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4D4A4A),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 1.0,
                                color: Colors.grey[300], // Màu xám nhạt
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0), // Khoảng cách ngang
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(top: 12, left: 31),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${widget.address.address}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          // const SizedBox(width: ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: const Icon(
                                                Icons.navigate_next_outlined),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 1.0,
                                color: Colors.grey[300], // Màu xám nhạt
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0), // Khoảng cách ngang
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  const SizedBox(width: 31),
                                  const Text(
                                    'Địa chỉ mặc định',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4D4A4A),
                                    ),
                                  ),
                                  const SizedBox(width: 140),
                                  Transform.scale(
                                    scale:
                                        0.85, // Thay đổi giá trị scale để điều chỉnh kích thước
                                    child: Switch(
                                      value: isDefault,
                                      onChanged: (value) {
                                        setState(() {
                                          isDefault = value;
                                        });
                                      },
                                      activeTrackColor: Colors.greenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Xử lý khi người dùng nhấn vào nút
                                },
                                child: Container(
                                  width: 286, // Độ rộng của nút vuông
                                  height: 43, // Độ cao của nút vuông
                                  decoration: BoxDecoration(
                                      color: const Color(
                                          0xFFEC8F5E), // Màu nền của nút vuông
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
                                      )),
                                  child: const Center(
                                    child: Text(
                                      'LƯU THAY ĐỔI',
                                      style: TextStyle(
                                        color:
                                            Colors.white, // Màu chữ của văn bản
                                        fontSize: 16, // Kích thước chữ
                                        fontWeight:
                                            FontWeight.bold, // Độ đậm của chữ
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
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

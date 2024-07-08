import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/page/order/ordersuccess.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String dropdownValue = 'Thanh toán khi nhận hàng';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: <Widget>[
      Stack(children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/layout/layout_1.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 40,
          left: 50,
          right: 50,
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/image/logo_2.png",
                        width: 140,
                        height: 140,
                      ),
                      const Icon(
                        Icons.notifications,
                        size: 40,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFF3B664),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFEC8F5E), // Màu viền
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ), // Bo góc viền
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Nhập mã giảm',
                      hintStyle: TextStyle(
                          color: Color(0xFFEC8F5E),
                          fontSize: 16), // Màu chữ gợi ý
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      border: InputBorder
                          .none, // Đặt border none để loại bỏ border mặc định của TextField
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Hành động khi nút được nhấn
                },
                child: Container(
                  width: 80, // Độ rộng của nút
                  height: 50, // Độ cao của nút
                  decoration: const BoxDecoration(
                    color: Color(0xFFEC8F5E), // Màu nền của nút
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ), // Độ cong góc của nút
                  ),
                  child: const Center(
                    child: Text(
                      'Sử dụng',
                      style: TextStyle(
                        color: Colors.white, // Màu chữ của nút
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'Địa chỉ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 270,
              ),
              Icon(
                Icons.note_alt_outlined,
                size: 24,
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3B664).withOpacity(0.32),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment
                        .centerLeft, // Căn giữa theo chiều ngang và dọc
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10), // Khoảng cách nội dung
                      child: Text(
                        'thch',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight:
                                FontWeight.bold), // Căn lề trái cho văn bản
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3B664).withOpacity(0.32),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment
                        .centerLeft, // Căn giữa theo chiều ngang và dọc
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10), // Khoảng cách nội dung
                      child: Text(
                        '123 Thành Thái Phường 6 Quận 10 TP Hồ Chí Minh',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight:
                                FontWeight.bold), // Căn lề trái cho văn bản
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  'Phương thức thanh toán',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(width: 30),
              Expanded(
                  child: Container(
                      width: 38,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF3B664).withOpacity(0.32),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            // Xử lý khi người dùng thay đổi lựa chọn
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 16),
                          dropdownColor: const Color(
                              0xFFFFC3B1), // Tùy chỉnh phong cách văn bản của DropdownButton
                          icon: const SizedBox
                              .shrink(), // Thay đổi biểu tượng mũi tên dropdown
                          elevation: 8,
                          underline: const SizedBox
                              .shrink(), // Độ nổi của hộp thoại dropdown
                          items: <String>[
                            'Thanh toán khi nhận hàng',
                            'Chuyển khoản ngân hàng',
                            'Thẻ tín dụng, ghi nợ',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors
                                        .black87), // Tùy chỉnh phong cách văn bản của DropdownMenuItem
                              ),
                            );
                          }).toList(),
                        ),
                      ))),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  'Thanh toán',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  width: 38,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3B664).withOpacity(0.32),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 12, left: 20, right: 20, bottom: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Số lượng sản phẩm'),
                            Text('Tổng tiền'),
                            Text('Phí vận chuyển'),
                            Text('Khuyến mãi'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tổng cộng',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('02'),
                            Text('11.000 VND '),
                            Text('15.000 VND'),
                            Text('0 VND'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '26.000 VND',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(166, 9, 9, 0.7),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderSuccess(),
                    ),
                  );
                },
                child: Container(
                  width: 180, // Độ rộng của nút
                  height: 50, // Độ cao của nút
                  decoration: const BoxDecoration(
                    color: Color(0xFFEC8F5E), // Màu nền của nút
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ), // Độ cong góc của nút
                  ),
                  child: const Center(
                    child: Text(
                      'Đặt hàng',
                      style: TextStyle(
                        color: Colors.white, // Màu chữ của nút
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      )
    ]))));
  }
}

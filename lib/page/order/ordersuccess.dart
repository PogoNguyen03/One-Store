import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_store/mainpage.dart';
import 'package:one_store/page/order/ordertracking.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

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
              // Row(
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       style: ElevatedButton.styleFrom(
              //         foregroundColor: Colors.black,
              //         backgroundColor: const Color(0xFFF3B664),
              //       ),
              //       child: const Icon(
              //         Icons.arrow_back_ios,
              //         size: 15,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ]),
      Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Expanded(
                  child: Row(
                children: [
                  Icon(
                    Icons
                        .check_circle_outline_rounded, // Thay thế bằng icon bạn muốn
                    color: Color(0xFFEC8F5E), // Màu sắc của icon
                    size: 35, // Kích thước của icon
                  ),
                  SizedBox(width: 8), // Khoảng cách giữa icon và văn bản
                  Expanded(
                      child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Đơn hàng ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEC8F5E))),
                    TextSpan(
                      text: 'DH0181263',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextSpan(
                        text: ' đã được xác nhận',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEC8F5E)))
                  ]))),
                ],
              )),
              SizedBox(
                width: 60,
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            children: [
              const SizedBox(
                width: 90,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ordertracking()));
                  },
                  child: Container(
                    width: 192, // Độ rộng của nút
                    height: 55, // Độ cao của nút
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3B664), // Màu nền của nút
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ), // Độ cong góc của nút
                    ),
                    child: const Center(
                      child: Text(
                        'Theo dõi đơn hàng',
                        style: TextStyle(
                          color: Colors.white, // Màu chữ của nút
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 90,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 90,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mainpage()));
                  },
                  child: Container(
                    width: 192, // Độ rộng của nút
                    height: 55, // Độ cao của nút
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3B664), // Màu nền của nút
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ), // Độ cong góc của nút
                    ),
                    child: const Center(
                      child: Text(
                        'Tiếp tục mua sắm',
                        style: TextStyle(
                          color: Colors.white, // Màu chữ của nút
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 90,
              ),
            ],
          ),
          const SizedBox(
            height: 200,
          ),
        ],
      )
    ]))));
  }
}

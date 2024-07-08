import 'package:flutter/material.dart';

class Ordertracking extends StatelessWidget {
  const Ordertracking({super.key});

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
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Column(
                children: [
                  Text(
                    '12:45',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    '01:30',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 84,
                  ),
                  Text(
                    '04:45',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 84,
                  ),
                  Text(
                    '06:32',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: VerticalDivider(
                            color: Colors.black26,
                            thickness: 2,
                            width: 20,
                            indent: 20,
                            endIndent: 22,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Icon(
                            Icons.do_not_disturb_on_sharp,
                            size: 20,
                            color: Color(0xFFEC8F5E),
                          ),
                          SizedBox(
                            height: 85,
                          ),
                          Icon(
                            Icons.do_not_disturb_on_sharp,
                            size: 20,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 85,
                          ),
                          Icon(
                            Icons.do_not_disturb_on_sharp,
                            size: 20,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 75,
                          ),
                          Icon(
                            Icons.do_not_disturb_on_sharp,
                            size: 20,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFEC8F5E), // Màu nền của hình tròn
                        ),
                        padding: const EdgeInsets.all(
                            8.0), // Khoảng cách giữa icon và viền tròn
                        child: const Icon(
                          Icons.note_alt_outlined,
                          size: 26, // Kích thước của icon
                          color: Colors.white, // Màu sắc của icon
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Đơn hàng đã đặt',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFEC8F5E)),
                            ),
                            Text(
                              'Chúng tôi đã nhận được đơn hàng của bạn',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFFEC8F5E)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black26, // Màu nền của hình tròn
                        ),
                        padding: const EdgeInsets.all(
                            8.0), // Khoảng cách giữa icon và viền tròn
                        child: const Icon(
                          Icons.download_done_rounded,
                          size: 26, // Kích thước của icon
                          color: Colors.white, // Màu sắc của icon
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Xác nhận đơn hàng',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF646060)),
                            ),
                            Text(
                              'Đơn hàng đã được xác nhận và tiến hành đóng gói',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black26, // Màu nền của hình tròn
                        ),
                        padding: const EdgeInsets.all(
                            8.0), // Khoảng cách giữa icon và viền tròn
                        child: const Icon(
                          Icons.motorcycle_outlined,
                          size: 26, // Kích thước của icon
                          color: Colors.white, // Màu sắc của icon
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Đang giao hàng',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF646060)),
                            ),
                            Text(
                              'Đơn hàng đang được giao đến bạn',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black26, // Màu nền của hình tròn
                        ),
                        padding: const EdgeInsets.all(
                            8.0), // Khoảng cách giữa icon và viền tròn
                        child: const Icon(
                          Icons.card_giftcard_rounded,
                          size: 26, // Kích thước của icon
                          color: Colors.white, // Màu sắc của icon
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hoàn thành',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF646060)),
                            ),
                            Text(
                              'Đơn hàng đã được giao đến bạn, hoàn thành thanh toán',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              const SizedBox(
                width: 40,
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

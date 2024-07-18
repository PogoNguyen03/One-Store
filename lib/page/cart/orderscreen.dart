import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/page/cart/successscreen.dart';

class OrderScreen extends StatelessWidget {
  final int totalQuantity;
  final double totalAmount;
  final double shippingFee = 25000; // Phí vận chuyển mặc định
  final int distinctProductCount;

  const OrderScreen({
    required this.totalQuantity,
    required this.totalAmount,
    required this.distinctProductCount,
  });

  @override
  Widget build(BuildContext context) {
    double totalBill = totalAmount + shippingFee;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.none,
          child: Container(
            color: Color(0xFFEC8F5E),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  child: Image.asset(
                    "assets/image/logo_2.png",
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 45,
                  right: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.notifications,
                          color: Color(0xFFFFFFFF)),
                      onPressed: () {
                        // Hành động khi nút được nhấn
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 115,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/layout/layout_5.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 20,
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
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 130, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Địa chỉ",
                                  style: TextStyle(
                                    fontSize: 24, // Kích thước chữ
                                    fontWeight: FontWeight.bold, // Đậm chữ
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(
                                        0xFFFBE7CD), // Màu nền của Container
                                    borderRadius: BorderRadius.circular(
                                        15), // Bo tròn các góc với bán kính 15
                                  ),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Phong Nguyễn",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(
                                        0xFFFBE7CD), // Màu nền của Container
                                    borderRadius: BorderRadius.circular(
                                        15), // Bo tròn các góc với bán kính 15
                                  ),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "1041/80/6A, Trần Xuân Soạn, Tân Hung, Q7",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 290, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Phương thức thanh toán",
                                  style: TextStyle(
                                    fontSize: 24, // Kích thước chữ
                                    fontWeight: FontWeight.bold, // Đậm chữ
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(
                                        0xFFFBE7CD), // Màu nền của Container
                                    borderRadius: BorderRadius.circular(
                                        15), // Bo tròn các góc với bán kính 15
                                  ),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Thanh toán khi nhận hàng',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 400, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Thanh toán",
                                  style: TextStyle(
                                    fontSize: 24, // Kích thước chữ
                                    fontWeight: FontWeight.bold, // Đậm chữ
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 180,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(
                                        0xFFFBE7CD), // Màu nền của Container
                                    borderRadius: BorderRadius.circular(
                                        15), // Bo tròn các góc với bán kính 15
                                  ),
                                  child: Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(2.5),
                                      1: FlexColumnWidth(1.5),
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          const TableCell(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Tổng số lượng sản phẩm:',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '$totalQuantity',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const TableRow(
                                        children: [
                                          SizedBox(height: 10),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const TableCell(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Tổng giá tiền sản phẩm:',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            NumberFormat('###,###.###₫')
                                                .format(totalAmount),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const TableRow(
                                        children: [
                                          SizedBox(height: 10),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const TableCell(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Phí vận chuyển:',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            NumberFormat('###,###.###₫')
                                                .format(shippingFee),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const TableRow(
                                        children: [
                                          SizedBox(height: 10),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          const TableCell(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Tổng hóa đơn:',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            NumberFormat('###,###.###₫')
                                                .format(totalBill),
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 760,
                  right: 30, // Đặt nút nằm bên phải
                  child: ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nhấn nút "Đặt hàng"
                      _handlePlaceOrder(context);
                    },
                    child: const Text('Đặt hàng'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFF3B664),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handlePlaceOrder(BuildContext context) async {
    // Đợi 1 giây để hiển thị màn hình SuccessScreen
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessScreen(),
      ),
    );

    // Sau khi hoàn thành đặt hàng, chờ 3 giây trước khi quay lại màn hình chủ
    await Future.delayed(Duration(seconds: 3));

    // Xóa giỏ hàng
    await DatabaseHelper.instance.clearCart();

    // Quay lại màn hình chủ
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }
}

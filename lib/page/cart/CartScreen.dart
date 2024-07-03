import 'package:flutter/material.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:one_store/page/cart/Cart_Body.dart';
import 'package:one_store/page/order/order.dart';
import 'package:one_store/page/setting/settingScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalPrice = 0;

  void updateTotalPrice(bool isChecked, int itemTotalPrice) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (isChecked) {
          totalPrice += itemTotalPrice;
        } else {
          totalPrice -= itemTotalPrice;
        }
        if (totalPrice < 0) totalPrice = 0;
      });
    });
  }

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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const settingScreen(),
                                  ),
                                );
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
                  Positioned(
                    top: 250, // Vị trí để gridview cart
                    left: 20,
                    right: 20,
                    bottom: 80, // Để gridview cuộn khi nó được đặt vào màn hình
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ItemCartGridView(
                              product: productsGrid[index],
                              onChanged: (isChecked, itemTotalPrice) {
                                updateTotalPrice(isChecked, itemTotalPrice);
                              },
                            ),
                            Container(
                              height: 1.0,
                              color: Colors.grey[300], // Màu xám nhạt
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10.0), // Khoảng cách ngang
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 800,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Tổng thanh toán',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${totalPrice} VND', // Hiển thị giá tổng thanh toán
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: const Color(0xFFF3B664),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fixedSize: const Size(183, 50) // Màu nền của nút
                              ),
                          child: const Text(
                            'Thanh toán',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 880,
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

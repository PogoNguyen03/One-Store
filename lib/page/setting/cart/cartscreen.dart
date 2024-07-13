import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:one_store/data/model/product_model.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final dbHelper = DatabaseHelper(); // Database helper instance

  List<Map<String, dynamic>> cartItems =
      []; // List to store cart items from SQLite
  double totalAmount = 0; // Total amount of items in cart

  @override
  void initState() {
    super.initState();
    loadCartItems(); // Load cart items from SQLite when screen initializes
  }

  // Method to load cart items from SQLite
  void loadCartItems() async {
    List<Map<String, dynamic>> items = await dbHelper.getCartItems();
    setState(() {
      cartItems = items;
      calculateTotalAmount();
    });
  }

  // Method to calculate total amount in cart
  void calculateTotalAmount() {
    totalAmount = cartItems.fold(
      0,
      (previousValue, item) =>
          previousValue + (item['price'] * item['quantity']),
    );
  }

  // Method to remove item from cart
  void removeFromCart(String productId) async {
    await dbHelper.removeFromCart(productId);
    loadCartItems(); // Reload items after removal
  }

  // Method to update quantity of an item in cart
  void updateCartItemQuantity(String productId, int newQuantity) async {
    await dbHelper.updateCartItemQuantity(productId, newQuantity);
    loadCartItems(); // Reload items after update
  }

  // Method to calculate the total amount for selected items
  void calculateSelectedTotalAmount() {
    totalAmount = cartItems.fold(
      0,
      (previousValue, item) {
        if (item['isSelected']) {
          return previousValue + (item['price'] * item['quantity']);
        }
        return previousValue;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
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
                top: 0,
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
                          // Handle notification button press
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 0,
                right: 0,
                bottom: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (cartItems.isEmpty)
                      const Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: Text(
                          "Giỏ hàng của bạn đang trống",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ))
                    else
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> cartItem = cartItems[index];

                            // Chuyển đổi Map thành ProductModel
                            ProductModel product = ProductModel(
                              productid: cartItem['product_id'],
                              imageUrl: cartItem['imageUrl'],
                              name: cartItem['name'],
                              price: cartItem['price'],
                              categoryItem: cartItem['categoryItem'],
                              categoryBook: cartItem['categoryBook'],
                              authorBook: cartItem['authorBook'],
                              publishingYear: cartItem['publishingYear'],
                              sizeBook: cartItem['sizeBook'],
                              weightBook: cartItem['weightBook'],
                              updateBook:
                                  DateTime.parse(cartItem['updateBook']),
                            );

                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Checkbox(
                                      //   value: cartItem['isSelected'] ?? false,
                                      //   onChanged: (bool? value) {
                                      //     setState(() {
                                      //       cartItem['isSelected'] =
                                      //           value ?? false;
                                      //       calculateSelectedTotalAmount();
                                      //     });
                                      //   },
                                      //   checkColor: Colors.white,
                                      //   activeColor: const Color(0xFFEC8F5E),
                                      // ),
                                      const SizedBox(width: 12),
                                      Image.asset(
                                        "assets/image/book/${product.imageUrl}",
                                        width: 80,
                                        height: 110,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              NumberFormat('###,###.###₫')
                                                  .format(product.price),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    updateCartItemQuantity(
                                                      product.productid,
                                                      cartItem['quantity'] + 1,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 28,
                                                    height: 28,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: const Color(
                                                          0xFFF3B664),
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Text(
                                                  '${cartItem['quantity']}',
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                InkWell(
                                                  onTap: () {
                                                    if (cartItem['quantity'] >
                                                        1) {
                                                      updateCartItemQuantity(
                                                        product.productid,
                                                        cartItem['quantity'] -
                                                            1,
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 28,
                                                    height: 28,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: const Color(
                                                          0xFFF3B664),
                                                    ),
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          removeFromCart(product.productid);
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8), // Optional spacing
                                  const Divider(
                                    color: Color(0xFFF3B664),
                                    thickness: 2,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       bottom: 50, right: 50, left: 50),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text(
                    //             "Tổng thanh toán",
                    //             style: TextStyle(
                    //                 color: Colors.black, fontSize: 15),
                    //           ),
                    //           Text(
                    //             '$totalAmount VND',
                    //             style: const TextStyle(
                    //               color: Colors.red,
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       ElevatedButton(
                    //         onPressed: () {
                    //           // Handle payment action
                    //         },
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor:
                    //               const Color(0xFFEC8F5E), // Background color
                    //           minimumSize: const Size(150, 50),
                    //         ),
                    //         child: const Text(
                    //           'Thanh toán',
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              Positioned(
                top: 700,
                child: Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Độ rộng bằng chiều rộng của màn hình
                  decoration: BoxDecoration(
                    color: Colors.white, // Màu nền của background
                  ),
                  padding: const EdgeInsets.all(20), // Padding của Container
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tổng thanh toán",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            NumberFormat('###,###.###₫').format(totalAmount),
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const OrderScreen(),
                          //   ),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: const Color(0xFFF3B664),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          fixedSize: const Size(183, 50),
                        ),
                        child: const Text(
                          'Thanh toán',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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

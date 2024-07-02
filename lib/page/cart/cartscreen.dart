import 'package:flutter/material.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:one_store/SQLite/sqlite.dart';

class CartScreen extends StatefulWidget {
  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                      Spacer(flex: 1),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    cartItems.isEmpty
                        ? Center(
                            child: Text('Giỏ hàng của bạn trống.'),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> cartItem =
                                    cartItems[index];
                                return ListTile(
                                  title: Text(cartItem['name']),
                                  subtitle: Text('${cartItem['price']} VNĐ'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          if (cartItem['quantity'] > 1) {
                                            updateCartItemQuantity(
                                              cartItem['product_id'],
                                              cartItem['quantity'] - 1,
                                            );
                                          }
                                        },
                                      ),
                                      Text('${cartItem['quantity']}'),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          updateCartItemQuantity(
                                            cartItem['product_id'],
                                            cartItem['quantity'] + 1,
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          removeFromCart(
                                              cartItem['product_id']);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Tổng cộng: $totalAmount VNĐ'),
                    ),
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

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
      appBar: AppBar(
        title: Text('Giỏ hàng'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text('Giỏ hàng của bạn trống.'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> cartItem = cartItems[index];
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
                                removeFromCart(cartItem['product_id']);
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
    );
  }
}

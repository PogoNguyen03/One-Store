// order_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_store/data/model/ordermodeladmin.dart';
class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  String _searchQuery = '';

  List<Order> get orders => _orders;
  String get searchQuery => _searchQuery;

  set searchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> loadOrders() async {
    try {
      final String response =
          await rootBundle.loadString('assets/files/orderlist.json');
      final data = await json.decode(response) as List;
      _orders = data.map((order) => Order.fromJson(order)).toList();
      notifyListeners();
    } catch (e) {
      print("Error loading orders: $e");
    }
  }
}

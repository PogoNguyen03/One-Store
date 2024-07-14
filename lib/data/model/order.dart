import 'package:one_store/data/model/users.dart';

class Order {
  final int? orderId;
  final double totalBill;
  final String orderDate;
  final String customerName;

  Order({
    this.orderId,
    required this.totalBill,
    required this.orderDate,
    required this.customerName,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'totalBill': totalBill,
      'orderDate': orderDate,
      'customerName': customerName,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderId: map['orderId'],
      totalBill: map['totalBill'],
      orderDate: map['orderDate'],
      customerName: map['customerName'],
    );
  }
}

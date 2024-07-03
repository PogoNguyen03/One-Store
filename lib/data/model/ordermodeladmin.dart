// order_model.dart
class Order {
  final int id;
  final String customerName;
  final String status;
  final double totalAmount;
  final DateTime orderTime;
  final List<OrderItem> items;
  final String customerAddress;
  final String customerPhone;

  Order({
    required this.id,
    required this.customerName,
    required this.status,
    required this.totalAmount,
    required this.orderTime,
    required this.items,
    required this.customerAddress,
    required this.customerPhone,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerName: json['customerName'],
      status: json['status'],
      totalAmount: json['totalAmount'],
      orderTime: DateTime.parse(json['orderTime']),
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      customerAddress: json['customerAddress'],
      customerPhone: json['customerPhone'],
    );
  }
}

class OrderItem {
  final String productName;
  final int quantity;

  OrderItem({
    required this.productName,
    required this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productName: json['productName'],
      quantity: json['quantity'],
    );
  }
}

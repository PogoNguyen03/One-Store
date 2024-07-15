class Promotion {
  final String code;
  final double value;
  final int quantity;
  final String status;
  final DateTime expiryDate;

  Promotion({
    required this.code,
    required this.value,
    required this.quantity,
    required this.status,
    required this.expiryDate,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      code: json['code'],
      value: json['value'].toDouble(),
      quantity: json['quantity'],
      status: json['status'],
      expiryDate: DateTime.parse(json['expiryDate']),
    );
  }
}

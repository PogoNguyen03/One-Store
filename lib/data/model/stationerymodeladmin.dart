class Stationery {
  final int id;
  final String name;
  final String material;
  final String originalPrice; // Giữ kiểu dữ liệu là String
  final String sellingPrice; // Giữ kiểu dữ liệu là String
  final String size;
  final String weight; // Giữ kiểu dữ liệu là String
  final int quantity;
  final String description;
  final String status;

  Stationery({
    required this.id,
    required this.name,
    required this.material,
    required this.originalPrice,
    required this.sellingPrice,
    required this.size,
    required this.weight,
    required this.quantity,
    required this.description,
    required this.status,
  });

  factory Stationery.fromMap(Map<String, dynamic> map) {
    return Stationery(
      id: map['id'],
      name: map['name'],
      material: map['material'],
      originalPrice:  map['originalPrice'].toString(), // Chuyển đổi giá trị sang String
      sellingPrice: map['sellingPrice'].toString(), // Chuyển đổi giá trị sang String
      size: map['size'],
      weight: map['weight'].toString(), // Chuyển đổi giá trị sang String
      quantity: map['quantity'],
      description: map['description'],
      status: map['status'],
    );
  }
}

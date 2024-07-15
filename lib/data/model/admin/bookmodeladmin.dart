class Book {
  String id;
  String name;
  String type;
  String author;
  double originalPrice;
  double price;
  int publishYear;
  String size;
  double weight;
  int quantity;
  String description;
  String status;

  Book({
    required this.id,
    required this.name,
    required this.type,
    required this.author,
    required this.originalPrice,
    required this.price,
    required this.publishYear,
    required this.size,
    required this.weight,
    required this.quantity,
    required this.description,
    required this.status,
  });

  // Phương thức để chuyển từ Map sang Book
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      author: map['author'],
      originalPrice: map['originalPrice'],
      price: map['price'],
      publishYear: map['publishYear'],
      size: map['size'],
      weight: map['weight'],
      quantity: map['quantity'],
      description: map['description'],
      status: map['status'],
    );
  }

  // Phương thức để chuyển từ Book sang Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'author': author,
      'originalPrice': originalPrice,
      'price': price,
      'publishYear': publishYear,
      'size': size,
      'weight': weight,
      'quantity': quantity,
      'description': description,
      'status': status,
    };
  }
}

// category_model.dart

class CategoryAdmin {
  final int id;
  final String name;

  CategoryAdmin({
    required this.id,
    required this.name,
  });

  factory CategoryAdmin.fromJson(Map<String, dynamic> json) {
    return CategoryAdmin(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

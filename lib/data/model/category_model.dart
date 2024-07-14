class CategoryBookModel {
  String categoryBookid, name;

  CategoryBookModel({
    required this.categoryBookid,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'categoryBookid': categoryBookid,
      'name': name,
    };
  }

  factory CategoryBookModel.fromMap(Map<String, dynamic> map) {
    return CategoryBookModel(
      categoryBookid: map['categoryBookid'],
      name: map['name'],
    );
  }
}

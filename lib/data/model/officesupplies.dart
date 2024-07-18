// import 'dart:ffi';

class OfficeSuppliesModel {
  String productid,
      imageUrl,
      name,
      categoryItem,
      categoryBook,
      chatlieu,
      publishingYear,
      sizeBook,
      weightBook;
  double price;
  double quantity;
  DateTime updateBook;

  OfficeSuppliesModel({
    required this.productid,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.categoryItem,
    required this.categoryBook,
    required this.chatlieu,
    required this.publishingYear,
    required this.sizeBook,
    required this.weightBook,
    required this.updateBook,
  });
}

List<OfficeSuppliesModel> officeGrid = [
  OfficeSuppliesModel(
    productid: "1",
    imageUrl: "butbixanh.png",
    name: "Bút bi xanh",
    price: 4000,
    categoryItem: "1",
    categoryBook: "1",
    chatlieu: "Nhựa",
    publishingYear: "2021",
    sizeBook: "1 x 10 cm",
    weightBook: "2g",
    updateBook: DateTime(2023, 5, 15, 14, 30),
  ),
  OfficeSuppliesModel(
    productid: "2",
    imageUrl: "butbicaocaphongha.png",
    name: "Bút bi cao cấp Hồng Ha",
    price: 520000,
    categoryItem: "1",
    categoryBook: "1",
    chatlieu: "Sắt",
    publishingYear: "2021",
    sizeBook: "1 x 10 cm",
    weightBook: "2g",
    updateBook: DateTime(2023, 5, 15, 14, 30),
  ),
  OfficeSuppliesModel(
    productid: "3",
    imageUrl: "butchigo.png",
    name: "Hộp bút chì gỗ",
    price: 10000,
    categoryItem: "1",
    categoryBook: "1",
    chatlieu: "Gỗ",
    publishingYear: "2021",
    sizeBook: "1 x 10 cm",
    weightBook: "2g",
    updateBook: DateTime(2023, 5, 15, 14, 30),
  ),
];

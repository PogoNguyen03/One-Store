class ProductModel {
  String productid, imageUrl, name, price;

  ProductModel({
    required this.productid,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
}

List<ProductModel> productsGrid = [
  ProductModel(
    productid: "1",
    imageUrl: "doithoaivoinhungnguoitienphong.png",
    name: "Đối thoại với những người tiên phong",
    price: "114000",
  ),
  ProductModel(
    productid: "2",
    imageUrl: "chiasetutraitim-bia.png",
    name: "Chia sẻ từ trái tim",
    price: "134000",
  ),
  ProductModel(
    productid: "3",
    imageUrl: "NFT.png",
    name: "NFT - Đáp Án Mới Cho Sự Thịnh Vượng",
    price: "70000",
  ),
  ProductModel(
    productid: "4",
    imageUrl: "lamchuthitruongnganh.png",
    name: "Làm chủ thị trường ngách",
    price: "102000",
  ),
  ProductModel(
    productid: "5",
    imageUrl: "frame-1.png",
    name: "Phát Triển Trí Não Cho Trẻ Qua Tô-Dán Và Nối Hình - Khủng Long",
    price: "41000",
  ),
  ProductModel(
    productid: "6",
    imageUrl: "bia_hanh-trinh-thai-giao-theo-chuyen-gia_2_1_1.png",
    name:
        "Hành Trình Thai Giáo 280 Ngày - Mỗi Ngày Đọc Một Trang (Tái Bản 2023)",
    price: "67000",
  ),
];

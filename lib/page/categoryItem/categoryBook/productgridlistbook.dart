import 'package:flutter/material.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:one_store/page/product/productdetailscreen.dart';

class ProductGrid extends StatefulWidget {
  final List<ProductModel> products;
  ProductGrid({required this.products});
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    _fetchProductsFromDatabase();
  }

  Future<void> _fetchProductsFromDatabase() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    List<ProductModel> fetchedProducts = await dbHelper
        .getProductsFromDatabase(); // Thay phương thức lấy sản phẩm từ SQLite tại đây
    setState(() {
      products = fetchedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(product),
                      ),
                    );
                  },
                  child: GridTile(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 254,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                child: SizedBox(
                                  height: 170,
                                  width: double.infinity,
                                  child: Image.network(
                                    product.imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${product.price} VNĐ',
                                        style: TextStyle(
                                          color: Colors.red[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

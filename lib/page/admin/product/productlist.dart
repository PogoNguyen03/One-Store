import 'package:flutter/material.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/product_model.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _databaseHelper.getProductsFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(
              child: Text("No products available"),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Failed to load products"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              ProductModel product = snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: product.imageUrl != null
                      ? NetworkImage(product
                          .imageUrl!) // Sử dụng NetworkImage cho imageUrl
                      : AssetImage('assets/images/default_product_image.png')
                          as ImageProvider, // Cần ép kiểu về ImageProvider
                ),
                title: Text(product.name ?? ""),
                subtitle: Text("Price: ${product.price.toString()}"),
              );
            },
          );
        },
      ),
    );
  }
}

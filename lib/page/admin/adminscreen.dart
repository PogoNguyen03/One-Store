import 'package:flutter/material.dart';
import 'package:one_store/page/admin/category/categorylist.dart';
import 'package:one_store/page/admin/product/productlist.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, Admin!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductList()),
                );
              },
              child: Text('Add New Product'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryListPage()),
                );
              },
              child: Text('Categories'),
            ),
          ],
        ),
      ),
    );
  }
}

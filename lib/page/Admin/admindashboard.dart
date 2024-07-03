import 'package:flutter/material.dart';
import 'package:one_store/conf/const.dart';
import 'package:one_store/page/Admin/category/categorymanagement.dart';
import 'package:one_store/page/Admin/order/ordermanagement.dart';
import 'package:one_store/page/Admin/product/productmanagement.dart';
import 'package:one_store/page/Admin/promotion/promotionmanagement.dart';
import 'package:one_store/page/Admin/user/usermanagement.dart';
import 'package:one_store/widgets/adminbutton.dart';


class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEC8F5E),
        title: Image.asset(
          'assets/image/logo_2.png',
          width: 130,
          height: 130,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            AdminButton(
              imagePath: 'assets/image/admin/user.png',
              label: 'Quản lý người dùng',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageUsersPage()),
                );
              },
            ),
            AdminButton(
              imagePath: 'assets/image/admin/order.png',
              label: 'Quản lý đơn hàng',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderManagementPage()),
                );
              },
            ),
            AdminButton(
              imagePath: 'assets/image/admin/product.png',
              label: 'Quản lý sản phẩm',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductManagementPage()),
                );
              },
            ),
            AdminButton(
              imagePath: 'assets/image/admin/promotion.png',
              label: 'Quản lý khuyến mãi',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ManagePromotionsPage()),
                );
              },
            ),
            AdminButton(
              imagePath: 'assets/image/admin/category.png',
              label: 'Quản lý danh mục',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ManageCategoryPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

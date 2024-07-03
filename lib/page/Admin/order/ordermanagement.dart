// order_management_page.dart
import 'package:flutter/material.dart';
import 'package:one_store/data/model/ordermodeladmin.dart';
import 'package:one_store/data/provider/orderprovideradmin.dart';
import 'package:one_store/page/Admin/order/updateorderpage.dart';
import 'package:provider/provider.dart';
import 'package:one_store/conf/const.dart';
import 'package:intl/intl.dart'; // Thư viện để định dạng ngày giờ

class OrderManagementPage extends StatefulWidget {
  @override
  _OrderManagementPageState createState() => _OrderManagementPageState();
}

class _OrderManagementPageState extends State<OrderManagementPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý đơn hàng'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Tìm kiếm',
                      labelStyle: TextStyle(color: buttonBackgroundColor),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonBackgroundColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonBackgroundColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonBackgroundColor),
                      ),
                      prefixIcon:
                          Icon(Icons.search, color: buttonBackgroundColor),
                    ),
                    onChanged: (value) {
                      Provider.of<OrderProvider>(context, listen: false)
                          .searchQuery = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<OrderProvider>(
                builder: (context, orderProvider, _) {
                  List<Order> filteredOrders =
                      orderProvider.orders.where((order) {
                    return order.customerName.toLowerCase().contains(
                            orderProvider.searchQuery.toLowerCase()) ||
                        order.status
                            .toLowerCase()
                            .contains(orderProvider.searchQuery.toLowerCase());
                  }).toList();

                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text('ID',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 2,
                                child: Text('Tên khách hàng',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 1,
                                child: Text('Trạng thái',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 1,
                                child: Text('Tổng tiền',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 1,
                                child: Text('Thời gian đặt hàng',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                      Divider(),
                      ...filteredOrders.map((order) {
                        return GestureDetector(
                          onTap: () {
                            // Xử lý sự kiện khi bấm vào đơn hàng
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateOrderPage(order: order),
                              ),
                            ).then((_) {
                              Provider.of<OrderProvider>(context, listen: false)
                                  .loadOrders();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1, child: Text(order.id.toString())),
                                SizedBox(width: 8),
                                Expanded(
                                    flex: 2, child: Text(order.customerName)),
                                SizedBox(width: 8),
                                Expanded(flex: 1, child: Text(order.status)),
                                SizedBox(width: 8),
                                Expanded(
                                    flex: 1,
                                    child: Text(order.totalAmount.toString())),
                                SizedBox(width: 8),
                                Expanded(
                                    flex: 1,
                                    child: Text(DateFormat('yyyy-MM-dd')
                                        .format(order.orderTime))),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

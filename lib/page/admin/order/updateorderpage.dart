import 'package:flutter/material.dart';
import 'package:one_store/conf/const.dart';
import 'package:intl/intl.dart';
import 'package:one_store/data/model/admin/ordermodeladmin.dart';

class UpdateOrderPage extends StatefulWidget {
  final Order order;

  UpdateOrderPage({required this.order});

  @override
  _UpdateOrderPageState createState() => _UpdateOrderPageState();
}

class _UpdateOrderPageState extends State<UpdateOrderPage> {
  late TextEditingController _customerNameController;
  late TextEditingController _customerAddressController;
  late TextEditingController _customerPhoneController;
  late TextEditingController _orderTimeController;
  late String _selectedStatus;

  final List<String> _statuses = [
    "Chờ xử lý",
    "Đang vận chuyển",
    "Đã giao",
    "Hủy đơn"
  ];

  @override
  void initState() {
    super.initState();

    _customerNameController =
        TextEditingController(text: widget.order.customerName);
    _customerAddressController =
        TextEditingController(text: widget.order.customerAddress);
    _customerPhoneController =
        TextEditingController(text: widget.order.customerPhone);

    // Chuyển đổi thời gian đặt hàng thành chuỗi định dạng
    _orderTimeController = TextEditingController(
      text: DateFormat('yyyy-MM-dd HH:mm').format(widget.order.orderTime),
    );

    // Kiểm tra xem trạng thái có khớp với một trong các giá trị trong _statuses không
    _selectedStatus = _statuses.contains(widget.order.status)
        ? widget.order.status
        : _statuses.first;
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _customerAddressController.dispose();
    _customerPhoneController.dispose();
    _orderTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật đơn hàng'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _customerNameController,
              decoration: InputDecoration(
                labelText: 'Tên khách hàng',
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
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _customerAddressController,
              decoration: InputDecoration(
                labelText: 'Địa chỉ',
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
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _customerPhoneController,
              decoration: InputDecoration(
                labelText: 'SĐT',
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
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _orderTimeController,
              readOnly: true, // Đặt trường này thành read-only
              decoration: InputDecoration(
                labelText: 'Thời gian đặt hàng',
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
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              items: _statuses.map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedStatus = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Trạng thái',
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
              ),
            ),
            SizedBox(height: 16),
            Text('Sản phẩm:', style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: widget.order.items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Text(item.productName)),
                      SizedBox(width: 8),
                      Expanded(flex: 1, child: Text('SL: ${item.quantity}')),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Xử lý cập nhật đơn hàng ở đây
              },
              child: Text('Cập nhật'),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

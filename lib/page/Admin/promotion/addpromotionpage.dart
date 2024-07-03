import 'package:flutter/material.dart';
import 'package:one_store/conf/const.dart';
import 'package:intl/intl.dart';

class AddPromotionPage extends StatefulWidget {
  @override
  _AddPromotionPageState createState() => _AddPromotionPageState();
}

class _AddPromotionPageState extends State<AddPromotionPage> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  String _selectedStatus = "Active";

  final List<String> _statuses = [
    "Active",
    "Inactive",
  ];

  @override
  void dispose() {
    _codeController.dispose();
    _valueController.dispose();
    _quantityController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm khuyến mãi'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Mã giảm', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
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
            Text('Giá trị (%)', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
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
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Text('Số lượng', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(
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
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Text('Thời hạn', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _expiryDateController,
              decoration: InputDecoration(
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
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _expiryDateController.text =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                }
              },
            ),
            SizedBox(height: 16),
            Text('Trạng thái', style: TextStyle(fontWeight: FontWeight.bold)),
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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text(
                  'Thêm mã giảm giá',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonBackgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

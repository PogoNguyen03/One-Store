import 'package:flutter/material.dart';
import 'package:one_store/conf/const.dart';
import 'package:intl/intl.dart';
import 'package:one_store/data/model/promotionmodeladmin.dart';

class UpdatePromotionPage extends StatefulWidget {
  final Promotion promotion;

  UpdatePromotionPage({required this.promotion});

  @override
  _UpdatePromotionPageState createState() => _UpdatePromotionPageState();
}

class _UpdatePromotionPageState extends State<UpdatePromotionPage> {
  late TextEditingController _codeController;
  late TextEditingController _valueController;
  late TextEditingController _quantityController;
  late TextEditingController _expiryDateController;
  late String _selectedStatus;

  final List<String> _statuses = [
    "Active",
    "Inactive",
  ];

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.promotion.code);
    _valueController =
        TextEditingController(text: widget.promotion.value.toString());
    _quantityController =
        TextEditingController(text: widget.promotion.quantity.toString());
    _expiryDateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(widget.promotion.expiryDate),
    );
    _selectedStatus = _statuses.contains(widget.promotion.status)
        ? widget.promotion.status
        : _statuses.first;
  }

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
        title: Text('Cập nhật khuyến mãi'),
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
                  initialDate: widget.promotion.expiryDate,
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Xử lý sự kiện khi bấm nút cập nhật
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Lưu ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Xử lý sự kiện khi bấm nút xóa
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Xóa',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

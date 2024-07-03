import 'package:flutter/material.dart';
import 'package:one_store/conf/const.dart';
import 'package:one_store/data/model/bookmodeladmin.dart';

class UpdateBookPage extends StatefulWidget {
  final Book book;

  UpdateBookPage({required this.book});

  @override
  _UpdateBookPageState createState() => _UpdateBookPageState();
}

class _UpdateBookPageState extends State<UpdateBookPage> {
  late TextEditingController _nameController;
  late String _selectedCategory;
  late TextEditingController _authorController;
  late TextEditingController _originalPriceController;
  late TextEditingController _salePriceController;
  late TextEditingController _publishYearController;
  late TextEditingController _sizeController;
  late TextEditingController _weightController;
  late TextEditingController _quantityController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.book.name);
    _selectedCategory = widget.book.type;
    _authorController = TextEditingController(text: widget.book.author);
    _originalPriceController =
        TextEditingController(text: widget.book.originalPrice.toString());
    _salePriceController =
        TextEditingController(text: widget.book.price.toString());
    _publishYearController =
        TextEditingController(text: widget.book.publishYear.toString());
    _sizeController = TextEditingController(text: widget.book.size);
    _weightController =
        TextEditingController(text: widget.book.weight.toString());
    _quantityController =
        TextEditingController(text: widget.book.quantity.toString());
    _descriptionController =
        TextEditingController(text: widget.book.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật sách'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tên sách',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
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
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thể loại',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
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
                          value: _selectedCategory,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCategory = newValue!;
                            });
                          },
                          items: <String>['Văn học', 'Tiểu thuyết', 'Tâm lý']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tác giả',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _authorController,
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Giá gốc',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _originalPriceController,
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Giá bán',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _salePriceController,
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Năm xuất bản',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _publishYearController,
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kích thước',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _sizeController,
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trọng lượng',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _weightController,
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Số lượng',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _quantityController,
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mô tả',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
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
                    maxLines: 5,
                  ),
                ],
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
                        // Xử lý sự kiện khi bấm nút cập nhật sách
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
                        // Xử lý sự kiện khi bấm nút xóa sản phẩm
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
      ),
    );
  }
}

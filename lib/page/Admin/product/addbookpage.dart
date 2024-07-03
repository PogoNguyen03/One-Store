import 'package:flutter/material.dart';
import 'package:one_store/conf/const.dart';

class AddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  String _selectedCategory = 'Văn học'; // Khởi tạo giá trị mặc định
  List<Map<String, dynamic>> _products = []; // Danh sách để lưu trữ các sản phẩm

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _originalPriceController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _publishYearController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _addProduct() {
    // Lấy dữ liệu từ các TextField
    final String name = _nameController.text;
    final String author = _authorController.text;
    final String originalPrice = _originalPriceController.text;
    final String sellingPrice = _sellingPriceController.text;
    final String publishYear = _publishYearController.text;
    final String size = _sizeController.text;
    final String weight = _weightController.text;
    final String quantity = _quantityController.text;
    final String description = _descriptionController.text;

    // Tạo một bản ghi sản phẩm mới
    Map<String, dynamic> newProduct = {
      'name': name,
      'category': _selectedCategory,
      'author': author,
      'originalPrice': originalPrice,
      'sellingPrice': sellingPrice,
      'publishYear': publishYear,
      'size': size,
      'weight': weight,
      'quantity': quantity,
      'description': description,
    };

    // Thêm sản phẩm vào danh sách
    setState(() {
      _products.add(newProduct);
    });

    // Xóa dữ liệu trong các TextField
    _nameController.clear();
    _authorController.clear();
    _originalPriceController.clear();
    _sellingPriceController.clear();
    _publishYearController.clear();
    _sizeController.clear();
    _weightController.clear();
    _quantityController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm sách'),
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
                    'Tên sản phẩm',
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
                          controller: _sellingPriceController,
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
                              borderSide:
                                  BorderSide(color: buttonBackgroundColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: buttonBackgroundColor),
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
                              borderSide:
                                  BorderSide(color: buttonBackgroundColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: buttonBackgroundColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: buttonBackgroundColor),
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
                    maxLines: 4,
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addProduct, // Gọi hàm _addProduct khi bấm nút
                child: Text(
                  'Thêm sản phẩm',
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
              SizedBox(height: 32),
              if (_products.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Danh sách sản phẩm đã thêm:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        return Card(
                          child: ListTile(
                            title: Text(product['name']),
                            subtitle: Text(
                                'Thể loại: ${product['category']}, Tác giả: ${product['author']}'),
                          ),
                        );
                      },
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

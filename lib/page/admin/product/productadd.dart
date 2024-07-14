import 'package:flutter/material.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/product_model.dart';

class ProductAdminPage extends StatefulWidget {
  @override
  _ProductAdminPageState createState() => _ProductAdminPageState();
}

class _ProductAdminPageState extends State<ProductAdminPage> {
  final _formKey = GlobalKey<FormState>();
  final _databaseHelper = DatabaseHelper();

  final _productIdController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _categoryItemController = TextEditingController();
  final _categoryBookController = TextEditingController();
  final _authorBookController = TextEditingController();
  final _publishingYearController = TextEditingController();
  final _sizeBookController = TextEditingController();
  final _weightBookController = TextEditingController();
  final _updateBookController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_productIdController, 'Product ID'),
              _buildTextField(_imageUrlController, 'Image URL'),
              _buildTextField(_nameController, 'Name'),
              _buildTextField(_priceController, 'Price', isNumeric: true),
              _buildTextField(_quantityController, 'Quantity', isNumeric: true),
              _buildTextField(_categoryItemController, 'Category Item'),
              _buildTextField(_categoryBookController, 'Category Book'),
              _buildTextField(_authorBookController, 'Author Book'),
              _buildTextField(_publishingYearController, 'Publishing Year'),
              _buildTextField(_sizeBookController, 'Size Book'),
              _buildTextField(_weightBookController, 'Weight Book'),
              _buildTextField(_updateBookController, 'Update Book (YYYY-MM-DD)',
                  isDate: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProduct,
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {bool isNumeric = false, bool isDate = false, bool isImageUrl = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        if (isDate) {
          // Check if date is valid
          try {
            DateTime.parse(value);
          } catch (e) {
            return 'Please enter a valid date';
          }
        }
        if (isImageUrl) {
          // Check if it's a valid URL
          // You can add more advanced URL validation logic here if needed
          if (!Uri.parse(value).isAbsolute || !value.startsWith('http')) {
            return 'Please enter a valid URL';
          }
        }
        return null;
      },
    );
  }

  void _addProduct() async {
    if (_formKey.currentState!.validate()) {
      ProductModel product = ProductModel(
        productid: _productIdController.text,
        imageUrl: _imageUrlController.text,
        name: _nameController.text,
        price: double.parse(_priceController.text),
        quantity: int.parse(_quantityController.text),
        categoryItem: _categoryItemController.text,
        categoryBook: _categoryBookController.text,
        authorBook: _authorBookController.text,
        publishingYear: _publishingYearController.text,
        sizeBook: _sizeBookController.text,
        weightBook: _weightBookController.text,
        updateBook: DateTime.parse(_updateBookController.text),
      );

      await _databaseHelper.addProduct(product);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Product added successfully!'),
      ));

      _formKey.currentState!.reset();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:one_store/data/provider/categoryprovider.dart';
import 'package:provider/provider.dart';
import 'package:one_store/conf/const.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // void _saveCategory() {
  //   if (_nameController.text.isNotEmpty) {
  //     final newCategory = Category(
  //       id: DateTime.now()
  //           .millisecondsSinceEpoch, // Unique ID for demo purposes
  //       name: _nameController.text,
  //     );

  //     Provider.of<CategoryProvider>(context, listen: false)
  //         .addCategory(newCategory);

  //     Navigator.pop(context); // Go back to the previous screen
  //   } else {
  //     // Show an error message if the name is empty
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Lỗi'),
  //         content: Text('Tên danh mục không được để trống'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm danh mục mới'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Tên danh mục', style: TextStyle(fontWeight: FontWeight.bold)),

            TextField(
              controller: _nameController,
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
                  'Thêm danh mục',
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

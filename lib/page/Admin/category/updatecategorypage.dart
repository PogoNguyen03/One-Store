import 'package:flutter/material.dart';
import 'package:one_store/data/model/category_model.dart';
import 'package:one_store/data/model/categorymodeladmin.dart';
import 'package:one_store/data/provider/categoryprovider.dart';
import 'package:provider/provider.dart';
import 'package:one_store/conf/const.dart';

class UpdateCategoryPage extends StatefulWidget {
  final CategoryAdmin category;

  const UpdateCategoryPage({Key? key, required this.category})
      : super(key: key);

  @override
  _UpdateCategoryPageState createState() => _UpdateCategoryPageState();
}

class _UpdateCategoryPageState extends State<UpdateCategoryPage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // void _updateCategory() {
  //   if (_nameController.text.isNotEmpty) {
  //     final updatedCategory = CategoryAdmin(
  //       id: widget.category.id,
  //       name: _nameController.text,
  //     );

  //     Provider.of<CategoryProvider>(context, listen: false)
  //         .updateCategory(updatedCategory);

  //     Navigator.pop(context); // Go back to the previous screen after update
  //   } else {
  //     // Show an error message if the name is empty
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('Category name cannot be empty'),
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

  void _deleteCategory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this category?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Provider.of<CategoryProvider>(context, listen: false)
              //     .deleteCategory(widget.category.id);
              // Navigator.popUntil(
              //     context,
              //     ModalRoute.withName(
              //         '/')); // Go back to home page after delete
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Category'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Category Name',
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

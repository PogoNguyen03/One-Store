// import 'package:flutter/material.dart';
// import 'package:one_store/SQLite/sqlite.dart';
// import 'package:one_store/data/model/category_model.dart';

// class CategoryAdd extends StatefulWidget {
//   final bool isUpdate;
//   final CategoryModel? categoryModel;

//   const CategoryAdd({Key? key, this.isUpdate = false, this.categoryModel})
//       : super(key: key);

//   @override
//   _CategoryAddState createState() => _CategoryAddState();
// }

// class _CategoryAddState extends State<CategoryAdd> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _imageUrlController = TextEditingController();

//   final DatabaseHelper _databaseHelper = DatabaseHelper();
//   Future<void> _onSave() async {
//     final name = _nameController.text;
//     final imageUrl = _imageUrlController.text;

//     await _databaseService.addCategory(CategoryModel(
//       categoryid: Uuid().v4(), // Sử dụng uuid để tạo categoryid duy nhất
//       imageUrl: imageUrl,
//       name: name,
//     ));

//     setState(() {});
//     Navigator.pop(context);
//   }

//   @override
//   void initState() {
//     super.initState();
//     if (widget.isUpdate && widget.categoryModel != null) {
//       _nameController.text = widget.categoryModel!.name;
//       _imageUrlController.text = widget.categoryModel!.imageUrl;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.isUpdate ? 'Update Category' : 'Add Category'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _imageUrlController,
//               decoration: InputDecoration(labelText: 'Image URL'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 if (widget.isUpdate) {
//                   await _updateCategory();
//                 } else {
//                   await _addCategory();
//                 }
//                 Navigator.pop(context);
//               },
//               child: Text(widget.isUpdate ? 'Update' : 'Add'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _addCategory() async {
//     String name = _nameController.text.trim();
//     String imageUrl = _imageUrlController.text.trim();
//     CategoryModel category = CategoryModel(name: name, imageUrl: imageUrl);
//     await _databaseHelper.insertCategory(category);
//   }

//   Future<void> _updateCategory() async {
//     String name = _nameController.text.trim();
//     String imageUrl = _imageUrlController.text.trim();
//     CategoryModel updatedCategory = CategoryModel(
//         id: widget.categoryModel!.id, name: name, imageUrl: imageUrl);
//     await _databaseHelper.updateCategory(updatedCategory);
//   }
// }

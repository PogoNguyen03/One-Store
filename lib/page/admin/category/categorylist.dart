import 'package:flutter/material.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/category_model.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<CategoryBookModel> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  void _fetchCategories() async {
    List<CategoryBookModel> categories = await _databaseHelper.getCategories();
    setState(() {
      _categories = categories;
    });
  }

  void _addCategory() async {
    final TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Category'),
          content: TextField(
            controller: categoryController,
            decoration: InputDecoration(hintText: 'Category Name'),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                String categoryName = categoryController.text;
                if (categoryName.isNotEmpty) {
                  CategoryBookModel newCategory = CategoryBookModel(
                    categoryBookid:
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    name: categoryName,
                  );
                  await _databaseHelper.addCategory(newCategory);
                  _fetchCategories();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addCategory,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_categories[index].name),
          );
        },
      ),
    );
  }
}

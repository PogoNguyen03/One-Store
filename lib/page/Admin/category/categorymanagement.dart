import 'package:flutter/material.dart';
import 'package:one_store/data/provider/categoryprovider.dart';
import 'package:one_store/page/Admin/category/addcategorypage.dart';
import 'package:one_store/page/Admin/category/updatecategorypage.dart';
import 'package:provider/provider.dart';
import 'package:one_store/conf/const.dart';

class ManageCategoryPage extends StatefulWidget {
  @override
  _ManageCategoryPageState createState() => _ManageCategoryPageState();
}

class _ManageCategoryPageState extends State<ManageCategoryPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý danh mục'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      Provider.of<CategoryProvider>(context, listen: false)
                          .searchQuery = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Tìm kiếm danh mục',
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
                      prefixIcon:
                          Icon(Icons.search, color: buttonBackgroundColor),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: buttonBackgroundColor),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: buttonBackgroundColor,
                    onPressed: () {
                      // Show a dialog or another screen to add a new category
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCategoryPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<CategoryProvider>(
                builder: (context, categoryProvider, child) {
                  return FractionallySizedBox(
                    widthFactor: 1.0,
                    child: DataTable(
                      columnSpacing: 16.0,
                      columns: [
                        DataColumn(
                            label: Expanded(
                                child: Text('ID', textAlign: TextAlign.start))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Tên danh mục',
                                    textAlign: TextAlign.start))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Hành động',
                                    textAlign: TextAlign.start))),
                      ],
                      rows: categoryProvider.categories.map((category) {
                        return DataRow(
                          cells: [
                            DataCell(Text(category.id.toString())),
                            DataCell(Text(category.name)),
                            DataCell(
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateCategoryPage(
                                          category: category),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

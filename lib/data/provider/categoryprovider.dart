// category_provider.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import 'package:one_store/data/model/categorymodeladmin.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryAdmin> _categories = [];
  String _searchQuery = '';

  List<CategoryAdmin> get categories => _categories
      .where((category) =>
          category.name.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();

  String get searchQuery => _searchQuery;

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  CategoryProvider() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      String jsonString = await rootBundle.loadString('assets/files/categorylist.json');
      List<dynamic> jsonList = json.decode(jsonString);
      _categories = jsonList.map((json) => CategoryAdmin.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  // void addCategory(CategoryAdmin category) {
  //   _categories.add(category);
  //   saveCategories();
  //   notifyListeners();
  // }

  // void updateCategory(int id, CategoryAdmin updatedCategory) {
  //   int index = _categories.indexWhere((category) => category.id == id);
  //   if (index != -1) {
  //     _categories[index] = updatedCategory;
  //     saveCategories();
  //     notifyListeners();
  //   }
  // }

  // void deleteCategory(int id) {
  //   _categories.removeWhere((category) => category.id == id);
  //   saveCategories();
  //   notifyListeners();
  // }

  // void saveCategories() {
  //   List<Map<String, dynamic>> jsonList =
  //       _categories.map((category) => category.toJson()).toList();
  //   // Convert to JSON string
  //   String jsonString = jsonEncode(jsonList);
  //   // Save to file
  //   // For simplicity, assume saving to assets/categories.json
  // }
}

// user_provider_admin.dart

import 'dart:convert';
import 'package:flutter/material.dart'; // Đảm bảo import đúng model người dùng
import 'package:flutter/services.dart' show rootBundle;
import 'package:one_store/data/model/usermodeladmin.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  String _searchQuery = '';

  List<User> get users => _users;
  String get searchQuery => _searchQuery;

  set searchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> loadUsers() async {
    String jsonString = await _loadUserAsset();
    List<dynamic> jsonList = json.decode(jsonString);
    _users = jsonList
        .map((json) => User.fromJson(json))
        .where((user) =>
            user.name.isNotEmpty &&
            user.username.isNotEmpty &&
            user.phone.isNotEmpty)
        .toList();
    notifyListeners();
  }

  Future<String> _loadUserAsset() async {
    return await rootBundle.loadString('assets/files/userlist.json');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:one_store/data/model/promotionmodeladmin.dart';

class PromotionProvider with ChangeNotifier {
  List<Promotion> _promotions = [];
  String _searchQuery = '';

  List<Promotion> get promotions => _promotions;
  String get searchQuery => _searchQuery;

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  Future<void> loadPromotions() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/files/promotionlist.json');
      List<dynamic> jsonResponse = json.decode(jsonString);
      _promotions =
          jsonResponse.map((data) => Promotion.fromJson(data)).toList();
      notifyListeners();
    } catch (e) {
      print("Error loading promotions: $e");
    }
  }
}

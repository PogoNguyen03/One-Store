import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteService {
  static Future<void> saveFavoriteStatus(
      String productId, bool isFavorite) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(productId, isFavorite);
    await _updateFavoriteList(productId, isFavorite);
  }

  static Future<bool> loadFavoriteStatus(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(productId) ?? false;
  }

  static Future<void> _updateFavoriteList(
      String productId, bool isFavorite) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteList = prefs.getStringList('favoriteList') ?? [];

    if (isFavorite) {
      favoriteList.add(productId);
    } else {
      favoriteList.remove(productId);
    }

    prefs.setStringList('favoriteList', favoriteList);
  }

  static Future<List<String>> loadFavoriteList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favoriteList') ?? [];
  }
}

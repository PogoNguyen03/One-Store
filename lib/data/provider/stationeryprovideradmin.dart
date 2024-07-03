// stationery_provider.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import 'package:one_store/data/model/stationerymodeladmin.dart';

class StationeryProvider with ChangeNotifier {
  List<Stationery> _stationeries = [];

  List<Stationery> get stationeries => _stationeries;

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  Future<void> loadStationeries() async {
    try {
      String jsonString = await rootBundle.loadString('assets/files/stationerylist.json');
      List<dynamic> jsonList = json.decode(jsonString);
      _stationeries = jsonList.map((e) => Stationery.fromMap(e)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading stationeries: $e');
    }
  }

  void updateStationery(Stationery updatedStationery) {
    // Logic để cập nhật thông tin văn phòng phẩm vào cơ sở dữ liệu
    // Ví dụ:
    int index = _stationeries
        .indexWhere((stationery) => stationery.id == updatedStationery.id);
    if (index != -1) {
      _stationeries[index] = updatedStationery;
      notifyListeners();
    }
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/address_model.dart';

class ReadAddressData {
  Future<List<Address>> loadAddressData() async {
    var data = await rootBundle.loadString("assets/files/addresslist.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List).map((e) => Address.fromJson(e)).toList();
  }
}

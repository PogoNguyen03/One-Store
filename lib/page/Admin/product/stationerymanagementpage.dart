// stationery_management.dart

import 'package:flutter/material.dart';
import 'package:one_store/data/model/stationerymodeladmin.dart';
import 'package:one_store/data/provider/stationeryprovideradmin.dart';
import 'package:one_store/page/Admin/product/addstationerypage.dart';
import 'package:one_store/page/Admin/product/updatestationerypage.dart';
import 'package:provider/provider.dart';
import 'package:one_store/conf/const.dart';


class StationeryManagementPage extends StatefulWidget {
  @override
  _StationeryManagementPageState createState() =>
      _StationeryManagementPageState();
}

class _StationeryManagementPageState extends State<StationeryManagementPage> {
  @override
  void initState() {
    super.initState();
    // Tải văn phòng phẩm khi trang được khởi tạo lần đầu
    Provider.of<StationeryProvider>(context, listen: false).loadStationeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý văn phòng phẩm'),
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
                    decoration: InputDecoration(
                      labelText: 'Tìm kiếm',
                      labelStyle: TextStyle(color: buttonBackgroundColor),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: buttonBackgroundColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: buttonBackgroundColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: buttonBackgroundColor,
                        ),
                      ),
                      prefixIcon:
                          Icon(Icons.search, color: buttonBackgroundColor),
                    ),
                    onChanged: (value) {
                      Provider.of<StationeryProvider>(context, listen: false)
                          .searchQuery = value;
                    },
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddStationeryPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<StationeryProvider>(
                builder: (context, stationeryProvider, _) {
                  // Lọc văn phòng phẩm dựa trên truy vấn tìm kiếm
                  List<Stationery> filteredStationeries =
                      stationeryProvider.stationeries.where((stationery) {
                    return stationery.name.toLowerCase().contains(
                            stationeryProvider.searchQuery.toLowerCase()) ||
                        stationery.material.toLowerCase().contains(
                            stationeryProvider.searchQuery.toLowerCase());
                  }).toList();

                  return ListView(
                    children: [
                      // Tiêu đề cột
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text('Tên',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8), // Khoảng cách giữa các cột
                            Expanded(
                                flex: 2,
                                child: Text('Loại',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8), // Khoảng cách giữa các cột
                            Expanded(
                                flex: 1,
                                child: Text('Giá',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8), // Khoảng cách giữa các cột
                            Expanded(
                                flex: 1,
                                child: Text('Trạng thái',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                      Divider(),
                      // Dữ liệu bảng
                      ...filteredStationeries.map((stationery) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateStationeryPage(
                                    stationery: stationery),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(flex: 2, child: Text(stationery.name)),
                                SizedBox(width: 8), // Khoảng cách giữa các cột
                                Expanded(flex: 2, child: Text(stationery.material)),
                                SizedBox(width: 8), // Khoảng cách giữa các cột
                                Expanded(
                                    flex: 1,
                                    child: Text(stationery.sellingPrice)),
                                SizedBox(width: 8), // Khoảng cách giữa các cột
                                Expanded(
                                    flex: 1, child: Text(stationery.status)),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
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

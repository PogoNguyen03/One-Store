import 'package:flutter/material.dart';
import 'package:one_store/data/model/promotionmodeladmin.dart';
import 'package:one_store/data/provider/promotionprovider.dart';
import 'package:one_store/page/Admin/promotion/addpromotionpage.dart';
import 'package:one_store/page/Admin/promotion/updatepromotion.dart';
import 'package:provider/provider.dart';
import 'package:one_store/conf/const.dart';
import 'package:intl/intl.dart';

class ManagePromotionsPage extends StatefulWidget {
  @override
  _ManagePromotionsPageState createState() => _ManagePromotionsPageState();
}

class _ManagePromotionsPageState extends State<ManagePromotionsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PromotionProvider>(context, listen: false).loadPromotions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý khuyến mãi'),
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
                    onChanged: (value) {
                      Provider.of<PromotionProvider>(context, listen: false)
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
                            builder: (context) => AddPromotionPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<PromotionProvider>(
                builder: (context, promotionProvider, _) {
                  List<Promotion> filteredPromotions =
                      promotionProvider.promotions.where((promotion) {
                    return promotion.code.toLowerCase().contains(
                            promotionProvider.searchQuery.toLowerCase()) ||
                        promotion.status.toLowerCase().contains(
                            promotionProvider.searchQuery.toLowerCase());
                  }).toList();

                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text('Mã giảm',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 1,
                                child: Text('Giá trị',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 1,
                                child: Text('Số lượng',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 1,
                                child: Text('Trạng thái',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 2,
                                child: Text('Thời hạn',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                      Divider(),
                      ...filteredPromotions.map((promotion) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdatePromotionPage(promotion: promotion),
                              ),
                            ).then((_) {
                              Provider.of<PromotionProvider>(context,
                                      listen: false)
                                  .loadPromotions();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(flex: 1, child: Text(promotion.code)),
                                SizedBox(width: 8),
                                Expanded(
                                    flex: 1,
                                    child: Text('${promotion.value}%')),
                                SizedBox(width: 8),
                                Expanded(
                                    flex: 1,
                                    child: Text('${promotion.quantity}')),
                                SizedBox(width: 8),
                                Expanded(
                                    flex: 1, child: Text(promotion.status)),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    DateFormat('yyyy-MM-dd')
                                        .format(promotion.expiryDate),
                                  ),
                                ),
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

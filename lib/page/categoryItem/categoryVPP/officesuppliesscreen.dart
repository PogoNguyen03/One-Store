import 'package:flutter/material.dart';
import 'package:one_store/data/model/category_officesupplies_model.dart';
import 'package:one_store/data/model/officesupplies.dart';
// import 'package:one_store/data/model/product_model.dart';
import 'package:one_store/page/categoryItem/categoryVPP/categorybooklistview.dart';
import 'package:one_store/page/categoryItem/categoryVPP/productgridlistbook.dart';
// // import 'package:one_store/page/product/productdetailscreen.dart';
// import 'package:one_store/page/categoryItem/categoryBook/categorybooklistview.dart';

class OfficeSuppliesScreen extends StatefulWidget {
  final String categoryId;

  OfficeSuppliesScreen({required this.categoryId});

  @override
  _OfficeSuppliesScreenState createState() => _OfficeSuppliesScreenState();
}

class _OfficeSuppliesScreenState extends State<OfficeSuppliesScreen> {
  List<OfficeSuppliesModel> filteredProducts = [];
  String selectedCategoryId = '';
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool noProductsFound = false;

  @override
  void initState() {
    super.initState();
    filterProducts(selectedCategoryId);
  }

  void filterProducts(String categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
      if (categoryId.isEmpty) {
        filteredProducts = officeGrid;
      } else {
        filteredProducts = officeGrid
            .where((product) => product.categoryBook == categoryId)
            .toList();
      }
    });
  }

  void updateFilter(List<OfficeSuppliesModel> newProducts) {
    setState(() {
      filteredProducts = newProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryOfficeSuppliesModel> categories = [
      CategoryOfficeSuppliesModel(categoryOfficeSuppliesid: '', name: 'Tất cả'),
      ...categoryOfficeSuppliesGrid,
    ];
    return Scaffold(
      key: _scaffoldKey,
      // endDrawer: Filter(
      //   productsGrid: productsGrid, // Your original list of products
      //   onFilterSelected: (filteredList, noProducts) {
      //     setState(() {
      //       filteredProducts = filteredList;
      //       noProductsFound = noProducts;
      //     });
      //   },
      // ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/layout/layout_2.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/image/logo_2.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      Spacer(flex: 1),
                      IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.notifications,
                            color: Colors.white),
                        onPressed: () {
                          // Hành động khi nút được nhấn
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 130,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Positioned(
                        top: 50,
                        left: 30,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CategoryVPPListView(
                          categories: categories,
                          onCategorySelected: (selectedCategory) {
                            filterProducts(
                                selectedCategory.categoryOfficeSuppliesid);
                          },
                          selectedCategoryId: selectedCategoryId,
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.tune, color: Colors.black),
                        onPressed: () {
                          // Hành động khi nút được nhấn
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                bottom: 0,
                child: noProductsFound
                    ? const Center(
                        child: Text(
                          "Không tìm thấy sản phẩm",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : OfficeGrid(products: filteredProducts),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

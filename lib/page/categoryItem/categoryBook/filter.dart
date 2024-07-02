import 'package:flutter/material.dart';
import 'package:one_store/data/model/product_model.dart';

class Filter extends StatefulWidget {
  final Function(List<ProductModel>, bool) onFilterSelected;
  final List<ProductModel> productsGrid;

  const Filter({
    Key? key,
    required this.onFilterSelected,
    required this.productsGrid,
  }) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String selectedSort = 'Mới nhất';
  String selectedPriceRange = 'Tất cả';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 50),
                child: Text(
                  "Sắp xếp theo",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                child: DropdownButtonFormField<String>(
                  value: selectedSort,
                  onChanged: (newValue) {
                    setState(() {
                      selectedSort = newValue!;
                    });
                  },
                  items: <String>[
                    'Mới nhất',
                    'Cũ nhất',
                    'Giá thấp lên cao',
                    'Giá cao xuống thấp',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  isExpanded: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 50),
                child: Text(
                  "Mức giá",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                child: DropdownButtonFormField<String>(
                  value: selectedPriceRange,
                  onChanged: (newValue) {
                    setState(() {
                      selectedPriceRange = newValue!;
                    });
                  },
                  items: <String>[
                    'Tất cả',
                    '0 - 50.000 VND',
                    '51.000 - 100.000 VND',
                    '101.000 - 150.000 VND',
                    '151.000 - 200.000 VND',
                    '200.000 VND trở lên',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  isExpanded: true,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 100.0, left: 100.0, top: 20.0),
            child: TextButton(
              onPressed: () {
                List<ProductModel> filteredProducts = widget.productsGrid;

                // Apply sorting
                if (selectedSort == 'Mới nhất') {
                  filteredProducts = _sortLatestToOldest(filteredProducts);
                } else if (selectedSort == 'Cũ nhất') {
                  filteredProducts = _sortOldestToLatest(filteredProducts);
                } else if (selectedSort == 'Giá thấp lên cao') {
                  filteredProducts = _sortPriceLowToHigh(filteredProducts);
                } else if (selectedSort == 'Giá cao xuống thấp') {
                  filteredProducts = _sortPriceHighToLow(filteredProducts);
                }

                // Apply price filtering
                if (selectedPriceRange == '0 - 50.000 VND') {
                  filteredProducts =
                      _filterByPriceRange(filteredProducts, 0, 50000);
                } else if (selectedPriceRange == '51.000 - 100.000 VND') {
                  filteredProducts =
                      _filterByPriceRange(filteredProducts, 51000, 100000);
                } else if (selectedPriceRange == '101.000 - 150.000 VND') {
                  filteredProducts =
                      _filterByPriceRange(filteredProducts, 101000, 150000);
                } else if (selectedPriceRange == '151.000 - 200.000 VND') {
                  filteredProducts =
                      _filterByPriceRange(filteredProducts, 151000, 200000);
                } else if (selectedPriceRange == '200.000 VND trở lên') {
                  filteredProducts = _filterByPriceRange(
                      filteredProducts, 200000, double.infinity);
                }

                // Check if there are no matching products
                bool noProductsFound = filteredProducts.isEmpty;

                widget.onFilterSelected(filteredProducts, noProductsFound);
                Navigator.of(context).pop(); // Close the drawer
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFEC8F5E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              child: const Text(
                "Lọc",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ProductModel> _sortLatestToOldest(List<ProductModel> products) {
    products.sort((a, b) => b.updateBook.compareTo(a.updateBook));
    return products;
  }

  List<ProductModel> _sortOldestToLatest(List<ProductModel> products) {
    products.sort((a, b) => a.updateBook.compareTo(b.updateBook));
    return products;
  }

  List<ProductModel> _sortPriceLowToHigh(List<ProductModel> products) {
    products.sort((a, b) => a.price.compareTo(b.price));
    return products;
  }

  List<ProductModel> _sortPriceHighToLow(List<ProductModel> products) {
    products.sort((a, b) => b.price.compareTo(a.price));
    return products;
  }

  List<ProductModel> _filterByPriceRange(
      List<ProductModel> products, double minPrice, double maxPrice) {
    return products.where((product) {
      double price = product.price;
      return price >= minPrice && price <= maxPrice;
    }).toList();
  }
}

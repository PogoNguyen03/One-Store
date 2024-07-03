import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:one_store/page/Admin/product/addbookpage.dart';
import 'package:one_store/page/Admin/product/updatebookpage.dart'; // Import trang UpdateBookPage
import 'package:one_store/conf/const.dart';
import 'package:one_store/data/provider/bookprovideradmin.dart';
import 'package:one_store/data/model/bookmodeladmin.dart';

class BookManagementPage extends StatefulWidget {
  @override
  _BookManagementPageState createState() => _BookManagementPageState();
}

class _BookManagementPageState extends State<BookManagementPage> {
  @override
  void initState() {
    super.initState();
    // Tải sách khi trang được khởi tạo lần đầu
    Provider.of<BookProvider>(context, listen: false).loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý sách'),
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
                          color: buttonBackgroundColor, // Màu viền khi focus
                        ),
                      ),
                      prefixIcon:
                          Icon(Icons.search, color: buttonBackgroundColor),
                    ),
                    onChanged: (value) {
                      Provider.of<BookProvider>(context, listen: false)
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
                      // Xử lý sự kiện khi bấm nút thêm sách
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddBookPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<BookProvider>(
                builder: (context, bookProvider, _) {
                  // Lọc sách dựa trên truy vấn tìm kiếm
                  List<Book> filteredBooks = bookProvider.books.where((book) {
                    return book.name
                            .toLowerCase()
                            .contains(bookProvider.searchQuery.toLowerCase()) ||
                        book.type
                            .toLowerCase()
                            .contains(bookProvider.searchQuery.toLowerCase());
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
                                child: Text('Thể loại',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8), // Khoảng cách giữa các cột
                            Expanded(
                                flex: 1,
                                child: Text('Giá bán'.toString(),
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
                      ...filteredBooks.map((book) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateBookPage(book: book),
                              ),
                            ).then((_) {
                              // Đặt phần này để cập nhật danh sách sau khi quay lại từ trang cập nhật
                              Provider.of<BookProvider>(context, listen: false)
                                  .loadBooks();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(flex: 2, child: Text(book.name)),
                                SizedBox(width: 8), // Khoảng cách giữa các cột
                                Expanded(flex: 2, child: Text(book.type)),
                                SizedBox(width: 8), // Khoảng cách giữa các cột
                                Expanded(
                                    flex: 1,
                                    child: Text(book.price.toString())),
                                SizedBox(width: 8), // Khoảng cách giữa các cột
                                Expanded(flex: 1, child: Text(book.status)),
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


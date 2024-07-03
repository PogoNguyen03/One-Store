import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import 'package:one_store/data/model/bookmodeladmin.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => _books;

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  Future<void> loadBooks() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/files/booklist.json');
      List<dynamic> jsonList = json.decode(jsonString);
      _books = jsonList.map((e) => Book.fromMap(e)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading books: $e');
    }
  }

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void updateBook(Book updatedBook) {
    // Tìm và cập nhật sách trong danh sách _books
    int index = _books.indexWhere((book) => book.id == updatedBook.id);
    if (index != -1) {
      _books[index] = updatedBook;
      notifyListeners();
    }
  }

  void removeBook(String bookId) {
    // Xóa sách khỏi danh sách _books
    _books.removeWhere((book) => book.id == bookId);
    notifyListeners();
  }
}

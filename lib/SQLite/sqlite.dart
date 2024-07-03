import 'package:one_store/data/model/address.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:one_store/data/model/users.dart';
// import 'package:one_store/data/model/note_model.dart';

class DatabaseHelper {
  final databaseName = "notes.db";
  // String noteTable =
  //     "CREATE TABLE notes (noteId INTEGER PRIMARY KEY AUTOINCREMENT, noteTitle TEXT NOT NULL, noteContent TEXT NOT NULL, createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";

  //Now we must create our user table into our sqlite db

  String user =
      "create table users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE,fullname TEXT UNIQUE,usrPassword TEXT, phoneNumber TEXT, address TEXT, gmail TEXT, usrBirday TEXT, isDefault INTEGER, usrImage TEXT)";

  String cartItemsTable = '''
  CREATE TABLE IF NOT EXISTS product_model (
    cart_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id TEXT NOT NULL,
    imageUrl TEXT NULL,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    quantity INTEGER NOT NULL,
    categoryItem TEXT NOT NULL,
    categoryBook TEXT NOT NULL,
    authorBook TEXT NOT NULL,
    publishingYear TEXT NOT NULL,
    sizeBook TEXT NOT NULL,
    weightBook TEXT NOT NULL,
    updateBook TEXT NOT NULL
  )
''';

  String addressesTable = '''
  CREATE TABLE IF NOT EXISTS addresses (
    address_id INTEGER PRIMARY KEY AUTOINCREMENT,
    street TEXT NOT NULL,
    city TEXT NOT NULL,
    district TEXT NOT NULL,
    ward TEXT NOT NULL
  )
''';

  //We are done in this section

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    print('Đường dẫn database: $path');
    // Xóa cơ sở dữ liệu hiện tại (nếu cần)
    // await deleteDatabase(path);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(user); // Tạo bảng users
      await db
          .execute(cartItemsTable); // Tạo bảng product_model (nếu chưa tồn tại)
      await db.execute(addressesTable);
    });
  }

  //Now we create login and sign up method
  //as we create sqlite other functionality in our previous video

  //IF you didn't watch my previous videos, check part 1 and part 2

  //Login Method

  Future<bool> login(Users user) async {
    final Database db = await initDB();

    // I forgot the password to check
    var result = await db.rawQuery(
        "select * from users where usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up
  Future<int> signup(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }

  Future<Users?> getUserByName(String userName) async {
    final Database db = await initDB();

    var result =
        await db.rawQuery("SELECT * FROM users WHERE usrName = '$userName'");
    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    } else {
      return null;
    }
  }

  // Xác nhận số điện thoại và tạo mật khẩu mới
  Future<bool> confirmPhoneNumber(String phoneNumber) async {
    final Database db = await initDB();

    var result = await db
        .rawQuery("SELECT * FROM users WHERE phoneNumber = '$phoneNumber'");
    return result.isNotEmpty;
  }

  //thay đổi mật khẩu trong trong trang đăng nhập
  Future<int> updatePassword(String phoneNumber, String newPassword) async {
    final Database db = await initDB();

    return db.update('users', {'usrPassword': newPassword},
        where: 'phoneNumber = ?', whereArgs: [phoneNumber]);
  }

  // gọi tên người dùng dùng
  Future<Users?> getUserByUsername(String username) async {
    final Database db = await initDB();

    var result =
        await db.rawQuery("SELECT * FROM users WHERE usrName = ?", [username]);

    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    } else {
      return null;
    }
  }

  //cập nhật dữ liệu trong profile người dùng
  Future<int> updateUser(Users user) async {
    final Database db = await initDB();
    return await db.update(
      'users',
      user.toMap(),
      where: 'usrId = ?',
      whereArgs: [user.usrId],
    );
  }

  //cập nhật hình ảnh
  Future<int> saveUserImage(int userId, String imagePath) async {
    final Database db = await initDB();

    return db.update('users', {'usrImage': imagePath},
        where: 'usrId = ?', whereArgs: [userId]);
  }

  Future<String?> getUserImage(int userId) async {
    final Database db = await initDB();

    var result = await db
        .rawQuery("SELECT usrImage FROM users WHERE usrId = ?", [userId]);

    if (result.isNotEmpty) {
      return result.first['usrImage'] as String?;
    } else {
      return null;
    }
  }

  // Thêm sản phẩm vào giỏ hàng
  Future<int> addToCart(ProductModel product, int quantity) async {
    final db = await initDB();

    // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    var cartItem = await db.rawQuery(
        "SELECT * FROM product_model WHERE product_id = '${product.productid}'");

    if (cartItem.isNotEmpty) {
      // Nếu sản phẩm đã có trong giỏ hàng, cập nhật số lượng
      int newQuantity =
          int.parse(cartItem.first['quantity'].toString()) + quantity;

      return await db.rawUpdate(
          "UPDATE product_model SET quantity = ? WHERE product_id = ?",
          [newQuantity, product.productid]);
    } else {
      // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới
      return await db.insert('product_model', {
        'product_id': product.productid,
        'name': product.name,
        'imageUrl': product.imageUrl,
        'quantity': quantity,
        'price': product.price,
        'categoryItem': product.categoryItem,
        'categoryBook': product.categoryBook,
        'authorBook': product.authorBook,
        'publishingYear': product.publishingYear,
        'sizeBook': product.sizeBook,
        'weightBook': product.weightBook,
        'updateBook':
            product.updateBook.toIso8601String(), // Convert DateTime to string
      });
    }
  }

  // Xóa sản phẩm khỏi giỏ hàng
  Future<int> removeFromCart(String productId) async {
    final db = await initDB();
    return await db.delete('product_model',
        where: 'product_id = ?', whereArgs: [productId]);
  }

  // Cập nhật số lượng sản phẩm trong giỏ hàng
  Future<int> updateCartItemQuantity(String productId, int newQuantity) async {
    final db = await initDB();
    return await db.rawUpdate(
        "UPDATE product_model SET quantity = ? WHERE product_id = ?",
        [newQuantity, productId]);
  }

  // Lấy danh sách sản phẩm trong giỏ hàng
  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await initDB();
    return await db.query('product_model');
  }

  // Tính tổng số tiền của giỏ hàng
  Future<double> calculateTotalAmount() async {
    final db = await initDB();
    var result = await db
        .rawQuery("SELECT SUM(quantity * price) AS total FROM cart_items");
    return (result.first['total'] ?? 0.0) as double;
  }

  // Method to save favorite status
  Future<int> saveFavoriteStatus(String productId, bool isFavorite) async {
    final db = await initDB();

    // Check if the product already exists
    var result = await db.rawQuery(
        "SELECT * FROM product_model WHERE product_id = '$productId'");

    if (result.isNotEmpty) {
      // Update existing record
      return await db.update(
          'product_model',
          {
            'isSelected': isFavorite ? 1 : 0,
          },
          where: 'product_id = ?',
          whereArgs: [productId]);
    } else {
      // Insert new record
      return await db.insert('product_model', {
        'product_id': productId,
        'isSelected': isFavorite ? 1 : 0,
      });
    }
  }

  //truy cập trang địa chỉ trong setting
  Future<List<Address>> getAddresses() async {
    final db = await initDB();
    var result = await db.query('addresses');
    List<Address> addresses =
        result.isNotEmpty ? result.map((e) => Address.fromMap(e)).toList() : [];
    return addresses;
  }

  Future<int> insertAddress(Address address) async {
    final db = await initDB();
    return await db.insert('addresses', address.toMap());
  }
}

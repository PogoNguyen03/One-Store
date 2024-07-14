import 'package:one_store/data/model/address.dart';
import 'package:one_store/data/model/category_model.dart';
import 'package:one_store/data/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:one_store/data/model/users.dart';

class DatabaseHelper {
  final databaseName = "notes.db";

  String userTable = '''
  CREATE TABLE IF NOT EXISTS users (
    usrId INTEGER PRIMARY KEY AUTOINCREMENT,
    usrName TEXT UNIQUE,
    fullname TEXT UNIQUE,
    usrPassword TEXT,
    phoneNumber TEXT,
    address TEXT,
    gmail TEXT,
    usrBirday TEXT,
    isDefault INTEGER,
    usrImage TEXT
  )
  ''';

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

  String ordersTable = '''
  CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    total_quantity INTEGER NOT NULL,
    total_amount REAL NOT NULL,
    shipping_fee REAL NOT NULL,
    order_date TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (usrId)
  )
  ''';

  String productsTable = '''
  CREATE TABLE IF NOT EXISTS product_model (
    product_id TEXT PRIMARY KEY,
    imageUrl TEXT,
    name TEXT,
    price REAL,
    quantity REAL,
    categoryItem TEXT,
    categoryBook TEXT,
    authorBook TEXT,
    publishingYear TEXT,
    sizeBook TEXT,
    weightBook TEXT,
    updateBook TEXT
  )
  ''';

  String categoriesTable = '''
  CREATE TABLE IF NOT EXISTS categories (
    categoryBookid TEXT PRIMARY KEY,
    name TEXT NOT NULL
  )
  ''';

  //thêm sản phẩm
  Future<int> addProduct(ProductModel product) async {
    final db = await initDB();
    return await db.insert('product_model', {
      'product_id': product.productid,
      'imageUrl': product.imageUrl,
      'name': product.name,
      'price': product.price,
      'quantity': product.quantity,
      'categoryItem': product.categoryItem,
      'categoryBook': product.categoryBook,
      'authorBook': product.authorBook,
      'publishingYear': product.publishingYear,
      'sizeBook': product.sizeBook,
      'weightBook': product.weightBook,
      'updateBook': product.updateBook.toIso8601String(),
    });
  }

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    print('Đường dẫn database: $path');

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(userTable); // Create user table
      await db.execute(cartItemsTable); // Create cart items table
      await db.execute(addressesTable); // Create addresses table
      await db.execute(productsTable); // Create products table
      await db.execute(ordersTable); // Create orders table
      await db.execute(categoriesTable); // Create categories table
      // Insert default admin user
      await db.insert('users', {
        'usrName': 'admin',
        'usrPassword': 'admin',
        'fullname': 'Administrator',
        'phoneNumber': '123456789',
        'address': 'Admin Address',
        'gmail': 'admin@example.com',
        'usrBirday': '1970-01-01',
        'isDefault': 1,
        'usrImage': ''
      });
    });
  }

  Future<bool> login(Users user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
        "SELECT * FROM users WHERE usrName = ? AND usrPassword = ?",
        [user.usrName, user.usrPassword]);
    return result.isNotEmpty;
  }

  Future<int> signup(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }

  Future<Users?> getUserByName(String userName) async {
    final Database db = await initDB();

    var result =
        await db.rawQuery("SELECT * FROM users WHERE usrName = ?", [userName]);
    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<bool> confirmPhoneNumber(String phoneNumber) async {
    final Database db = await initDB();

    var result = await db
        .rawQuery("SELECT * FROM users WHERE phoneNumber = ?", [phoneNumber]);
    return result.isNotEmpty;
  }

  Future<int> updatePassword(String phoneNumber, String newPassword) async {
    final Database db = await initDB();

    return db.update('users', {'usrPassword': newPassword},
        where: 'phoneNumber = ?', whereArgs: [phoneNumber]);
  }

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

  Future<int> updateUser(Users user) async {
    final Database db = await initDB();
    return await db.update(
      'users',
      user.toMap(),
      where: 'usrId = ?',
      whereArgs: [user.usrId],
    );
  }

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

  Future<int> addToCart(ProductModel product, int quantity) async {
    final db = await initDB();

    var cartItem = await db.rawQuery(
        "SELECT * FROM product_model WHERE product_id = ?",
        [product.productid]);

    if (cartItem.isNotEmpty) {
      int newQuantity =
          int.parse(cartItem.first['quantity'].toString()) + quantity;

      return await db.rawUpdate(
          "UPDATE product_model SET quantity = ? WHERE product_id = ?",
          [newQuantity, product.productid]);
    } else {
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
        'updateBook': product.updateBook.toIso8601String(),
      });
    }
  }

  Future<int> removeFromCart(String productId) async {
    final db = await initDB();
    return await db.delete('product_model',
        where: 'product_id = ?', whereArgs: [productId]);
  }

  Future<int> updateCartItemQuantity(String productId, int newQuantity) async {
    final db = await initDB();
    return await db.rawUpdate(
        "UPDATE product_model SET quantity = ? WHERE product_id = ?",
        [newQuantity, productId]);
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await initDB();
    return await db.query('product_model');
  }

  Future<double> calculateTotalAmount() async {
    final db = await initDB();
    var result = await db
        .rawQuery("SELECT SUM(quantity * price) AS total FROM cart_items");
    return (result.first['total'] ?? 0.0) as double;
  }

  Future<int> saveFavoriteStatus(String productId, bool isFavorite) async {
    final db = await initDB();

    var result = await db.rawQuery(
        "SELECT * FROM product_model WHERE product_id = ?", [productId]);

    if (result.isNotEmpty) {
      return await db.update(
          'product_model',
          {
            'isSelected': isFavorite ? 1 : 0,
          },
          where: 'product_id = ?',
          whereArgs: [productId]);
    } else {
      return await db.insert('product_model', {
        'product_id': productId,
        'isSelected': isFavorite ? 1 : 0,
      });
    }
  }

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

  //gọi sản phẩm
  Future<List<ProductModel>> getProductsFromDatabase() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('product_model');

    return List.generate(maps.length, (i) {
      return ProductModel(
        productid: maps[i]['product_id'],
        imageUrl: maps[i]['imageUrl'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        quantity: maps[i]['quantity'],
        categoryItem: maps[i]['categoryItem'],
        categoryBook: maps[i]['categoryBook'],
        authorBook: maps[i]['authorBook'],
        publishingYear: maps[i]['publishingYear'],
        sizeBook: maps[i]['sizeBook'],
        weightBook: maps[i]['weightBook'],
        updateBook: DateTime.parse(maps[i]['updateBook']),
      );
    });
  }

  //Thể loại
  Future<int> addCategory(CategoryBookModel category) async {
    final db = await initDB();
    return await db.insert('categories', category.toMap());
  }

  Future<List<CategoryBookModel>> getCategories() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('categories');

    return List.generate(maps.length, (i) {
      return CategoryBookModel(
        categoryBookid: maps[i]['categoryBookid'],
        name: maps[i]['name'],
      );
    });
  }
}

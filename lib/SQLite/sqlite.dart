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
      "create table users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE,fullname TEXT UNIQUE,usrPassword TEXT, phoneNumber TEXT, address TEXT, gmail TEXT, usrBirday TEXT, isDefault INTEGER)";

  //We are done in this section

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    // Xóa cơ sở dữ liệu hiện tại (nếu cần)
    // await deleteDatabase(path);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(user);
      // await db.execute(noteTable);
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

  // //Search Method
  // Future<List<NoteModel>> searchNotes(String keyword) async {
  //   final Database db = await initDB();
  //   List<Map<String, Object?>> searchResult = await db
  //       .rawQuery("select * from notes where noteTitle LIKE ?", ["%$keyword%"]);
  //   return searchResult.map((e) => NoteModel.fromMap(e)).toList();
  // }

  //CRUD Methods

  // //Create Note
  // Future<int> createNote(NoteModel note) async {
  //   final Database db = await initDB();
  //   return db.insert('notes', note.toMap());
  // }

  // //Get notes
  // Future<List<NoteModel>> getNotes() async {
  //   final Database db = await initDB();
  //   List<Map<String, Object?>> result = await db.query('notes');
  //   return result.map((e) => NoteModel.fromMap(e)).toList();
  // }

  // //Delete Notes
  // Future<int> deleteNote(int id) async {
  //   final Database db = await initDB();
  //   return db.delete('notes', where: 'noteId = ?', whereArgs: [id]);
  // }

  // //Update Notes
  // Future<int> updateNote(title, content, noteId) async {
  //   final Database db = await initDB();
  //   return db.rawUpdate(
  //       'update notes set noteTitle = ?, noteContent = ? where noteId = ?',
  //       [title, content, noteId]);
  // }
}

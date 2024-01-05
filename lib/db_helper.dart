import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  DBHelper._(); // private constructor to prevent instantiation

  static final DBHelper instance = DBHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'user.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create your tables here
        await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY,
            name TEXT,
            email TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    return await db.insert('user', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await instance.database;
    return await db.query('user');
  }

  Future<List<Map<String, dynamic>>> getUsersByEmail(String email) async {
    Database db = await instance.database;
    return await db.query('user', where: 'email = ?', whereArgs: [email]);
  }

  Future<List<Map<String, dynamic>>> getUsersByEmailAndPassword(
      String email, String password) async {
    Database db = await instance.database;
    return await db.query('user',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
  }

  Future<int> updateUser(String currentUsername, Map<String, dynamic> updatedUser) async {
    Database db = await instance.database;
    return await db.update('user', updatedUser, where: 'name = ?', whereArgs: [currentUsername]);
  }
}
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';
import '../models/movie.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'movies_app.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE movies (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        year TEXT NOT NULL,
        director TEXT NOT NULL,
        genre TEXT NOT NULL,
        synopsis TEXT NOT NULL,
        imageUrl TEXT NOT NULL
      )
    ''');
  }

  // User operations
  Future<int> insertUser(User user) async {
    Database db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> getUser(String username, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }

  // Movie operations
  Future<int> insertMovie(Movie movie) async {
    Database db = await database;
    return await db.insert('movies', movie.toMap());
  }

  Future<List<Movie>> getMovies() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('movies');
    return result.map((map) => Movie.fromMap(map)).toList();
  }

  Future<int> deleteMovie(int id) async {
    Database db = await database;
    return await db.delete('movies', where: 'id = ?', whereArgs: [id]);
  }
}

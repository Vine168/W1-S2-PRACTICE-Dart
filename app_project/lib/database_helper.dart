import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static Database? _database;

  // Table and Database Name
  static const String dbName = 'music_app.db';
  static const String tableName = 'songs';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  // CREATE TABLE
  Future _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        artist TEXT,
        duration TEXT,
        filePath TEXT
      )
    ''');
  }

  // CREATE: Insert a Song
  Future<int> insertSong(Map<String, dynamic> song) async {
    final db = await database;
    return await db.insert(tableName, song);
  }

  // READ: Fetch All Songs
  Future<List<Map<String, dynamic>>> getAllSongs() async {
    final db = await database;
    return await db.query(tableName);
  }

  // UPDATE: Update a Song by ID
  Future<int> updateSong(int id, Map<String, dynamic> updatedSong) async {
    final db = await database;
    return await db.update(
      tableName,
      updatedSong,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE: Delete a Song by ID
  Future<int> deleteSong(int id) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

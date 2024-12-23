import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'songs.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE songs(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            artist TEXT,
            imagePath TEXT,
            mp3Path TEXT,
            isFavorite INTEGER DEFAULT 0
          )
        ''');
      },
    );
  }

  Future<void> insertSong(String title, String artist, String imagePath, String mp3Path) async {
    final db = await database;
    await db.insert(
      'songs',
      {
        'title': title,
        'artist': artist,
        'imagePath': imagePath,
        'mp3Path': mp3Path,
        'isFavorite': 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getSongs() async {
    final db = await database;
    return await db.query('songs');
  }

  Future<void> updateSong(int id, String title, String artist, String imagePath, String mp3Path, bool isFavorite) async {
    final db = await database;
    await db.update(
      'songs',
      {
        'title': title,
        'artist': artist,
        'imagePath': imagePath,
        'mp3Path': mp3Path,
        'isFavorite': isFavorite ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> searchSongs(String query) async {
    final db = await database;
    return await db.query(
      'songs',
      where: 'title LIKE ? OR artist LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );
  }
}

import 'package:itvolga/model/model_week.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseWeek {
  static final DatabaseWeek _instance = DatabaseWeek._internal();
  factory DatabaseWeek() => _instance;
  static Database? _database;

  DatabaseWeek._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'days_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE days(
        id INTEGER PRIMARY KEY,
        day TEXT,
        meals INTEGER,
        calories INTEGER
      )
    ''');

    // Вставка начальных данных
    await db.insert('days', {'day': 'Понидельник', 'meals': 0, 'calories': 0});
    await db.insert('days', {'day': 'Вторник', 'meals': 0, 'calories': 0});
    await db.insert('days', {'day': 'Среда', 'meals': 0, 'calories': 0});
    await db.insert('days', {'day': 'Четверг', 'meals': 0, 'calories': 0});
    await db.insert('days', {'day': 'Пятница', 'meals': 0, 'calories': 0});
    await db.insert('days', {'day': 'Субота', 'meals': 0, 'calories': 0});
    await db.insert('days', {'day': 'Воскрисенье', 'meals': 0, 'calories': 0});
  }

  Future<List<Day>> getDays() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('days');
    return List.generate(maps.length, (i) {
      return Day.fromMap(maps[i]);
    });
  }

  Future<void> updateDay(Day day) async {
    final db = await database;
    await db.update(
      'days',
      day.toMap(),
      where: 'id = ?',
      whereArgs: [day.id],
    );
  }
}
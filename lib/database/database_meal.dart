import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:itvolga/model/model_meal.dart';

class MealDatabaseHelper {
  static final MealDatabaseHelper _instance = MealDatabaseHelper._internal();
  factory MealDatabaseHelper() => _instance;
  static Database? _database;

  MealDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'meals_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE meals(
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      url_img TEXT NOT NULL,
      calories INTEGER NOT NULL,
      day_id INTEGER NOT NULL
    )
  ''');

    await db.insert('meals', {
      'title': 'Завтрак',
      'url_img': 'assets/img_user/breakfast.jpg',
      'calories': 500,
      'day_id': 1,
    });
  }

  Future<List<Meal>> getMealsForDay(int dayId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'meals',
      where: 'day_id = ?',
      whereArgs: [dayId],
    );
    return List.generate(maps.length, (i) {
      return Meal.fromMap(maps[i]);
    });
  }

  Future<Meal> getMealById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'meals',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Meal.fromMap(maps.first);
    } else {
      throw Exception('Meal not found');
    }
  }

  Future<void> insertMeal(Meal meal) async {
    final db = await database;
    await db.insert('meals', meal.toMap());
  }

  Future<void> updateMeal(Meal meal) async {
    final db = await database;
    await db.update(
      'meals',
      meal.toMap(),
      where: 'id = ?',
      whereArgs: [meal.id],
    );
  }
}
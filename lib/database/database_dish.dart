import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:itvolga/model/model_dish.dart';

class DishDatabase {
  static final DishDatabase _instance = DishDatabase._internal();
  factory DishDatabase() => _instance;
  static Database? _database;

  DishDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dishes_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE dishes(
      id INTEGER PRIMARY KEY,
      name TEXT,
      meal_id INTEGER,
      calories INTEGER NOT NULL,
      image_url TEXT
    )
  ''');

    await db.insert('dishes', {
      'name': 'Блюдо 1',
      'meal_id': 1,
      'image_url': 'assets/img_user/breakfast.jpg',
      'calories': 300,
    });
    await db.insert('dishes', {
      'name': 'Блюдо 2',
      'meal_id': 1,
      'image_url': 'assets/img_user/breakfast.jpg',
      'calories': 400,
    });
  }

  Future<List<Dish>> getDishesForMeal(int mealId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'dishes',
      where: 'meal_id = ?',
      whereArgs: [mealId],
    );
    return List.generate(maps.length, (i) {
      return Dish.fromMap(maps[i]);
    });
  }

  Future<void> insertDish(Dish dish) async {
    final db = await database;
    await db.insert('dishes', dish.toMap());
  }
}
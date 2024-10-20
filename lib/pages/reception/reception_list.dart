import 'package:flutter/material.dart';
import 'package:itvolga/database/database_meal.dart';
import '../../model/model_meal.dart';
import 'reception_item.dart';

class ReceptionList extends StatefulWidget {
  late final List<Meal> meals;

  ReceptionList({required this.meals});

  @override
  _ReceptionListState createState() => _ReceptionListState();
}

class _ReceptionListState extends State<ReceptionList> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _deleteMeal(int mealId) async {
    await MealDatabaseHelper().deleteMealAndDishes(mealId);
    await _loadMeals(); // Перезагружаем список приемов пищи
  }

  Future<void> _loadMeals() async {
    final loadedMeals = await MealDatabaseHelper()
        .getMealsForDay(1); // Замените 1 на нужный dayId
    setState(() {
      widget.meals = loadedMeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.meals.length,
      itemBuilder: (context, index) {
        final meal = widget.meals[index];
        return ReceptionItem(
          id: meal.id!,
          title: meal.title,
          img: meal.urlImg,
          calories: meal.calories!,
          onDelete: () => _deleteMeal(meal.id!),
        );
      },
    );
  }
}

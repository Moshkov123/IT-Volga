import 'package:flutter/material.dart';
import 'package:itvolga/pages/dishs/dish_list.dart';
import 'package:itvolga/pages/form_dish/form_dish_page.dart';
import 'package:itvolga/widgets/oval_button.dart';
import 'package:itvolga/model/model_dish.dart';
import '../../database/database_dish.dart';

class DishPage extends StatelessWidget {
  const DishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    int mealId = args?['mealId'] ?? 1; // Задаем значение по умолчанию

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dish Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFF28A745),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Dish>>(
              future: DishDatabase().getDishesForMeal(mealId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Ошибка: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Нет данных'));
                } else {
                  return DishList(
                      indexList:
                          snapshot.data!); // Pass the list of Dish objects
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OvalButton(
              text: 'Добавить',
              onPressed: () {
                // Вызываем форму для добавления нового приема пищи
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormDishPage(mealId: mealId),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

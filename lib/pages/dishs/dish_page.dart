import 'package:flutter/material.dart';
import 'package:itvolga/pages/dishs/dish_list.dart';
import 'package:itvolga/widgets/oval_button.dart';
import 'package:itvolga/model/model_dish.dart';
import '../../database/database_dish.dart';

class DishPage extends StatelessWidget {
  const DishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    int mealId = args?['mealId'] ?? 1; // Задаем значение по умолчанию

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dish Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFF28A745),
      ),
      body: FutureBuilder<List<Dish>>(
        future: DishDatabase().getDishesForMeal(mealId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Нет данных'));
          } else {
            List<Map<String, dynamic>> dishList = snapshot.data!.map((dish) {
              return {
                'title': dish.name,
                'img': dish.imageUrl,
                'calories': dish.calories ?? 0, // Добавляем значение по умолчанию
              };
            }).toList();

            return Column(
              children: [
                Expanded(
                  child: DishList(indexList: dishList),
                ),
                OvalButton(
                  text: 'Добавить',
                  onPressed: () {
                    print('Кнопка нажата');
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
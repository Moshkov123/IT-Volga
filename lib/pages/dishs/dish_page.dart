import 'package:flutter/material.dart';
import 'package:itvolga/pages/dishs/dish_list.dart';
import 'package:itvolga/widgets/oval_button.dart';

class DishPage extends StatelessWidget {
  const DishPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Создаем список данных для DishList
    List<Map<String, dynamic>> dishList = [
      {'title': 'Item 1', 'calories': 150, 'img': 'https://via.placeholder.com/100x100'},
      {'title': 'Item 2', 'calories': 250, 'img': 'https://via.placeholder.com/100x100'},
      // Добавьте другие элементы по мере необходимости
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dish Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFF28A745),
      ),
      body: Column(
        children: [
          Expanded(
            child: DishList(indexList: dishList),
          ),
          OvalButton(text: 'Добавить',
            onPressed: () {
            print('Кнопка нажата');
          },)
        ],
      ),
    );
  }
}
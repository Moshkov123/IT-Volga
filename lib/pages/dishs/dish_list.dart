import 'package:flutter/material.dart';
import 'dish_item.dart'; // Убедитесь, что путь к файлу правильный

class DishList extends StatelessWidget {
  final List<Map<String, dynamic>> indexList;

  const DishList({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0), // Добавляем верхний отступ
      child: ListView.separated(
        itemCount: indexList.length,
        separatorBuilder: (context, index) => SizedBox(height: 10), // Добавляем интервал между элементами
        itemBuilder: (context, index) {
          return DishItem(
            title: indexList[index]['title'],
            img: indexList[index]['img'],
            calories: indexList[index]['calories'],
          );
        },
      ),
    );
  }
}
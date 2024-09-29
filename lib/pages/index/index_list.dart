import 'package:flutter/material.dart';
import 'index_item.dart'; // Убедитесь, что путь к файлу правильный
import 'package:itvolga/model/model_week.dart'; // Импортируем класс Day

class IndexList extends StatelessWidget {
  final List<Day> indexList;

  const IndexList({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0), // Добавляем верхний отступ
      child: ListView.separated(
        itemCount: indexList.length,
        separatorBuilder: (context, index) => SizedBox(height: 10), // Добавляем интервал между элементами
        itemBuilder: (context, index) {
          final day = indexList[index];
          return IndexItem(
            day: day.day,
            calories: day.calories,
            meals: day.meals,
          );
        },
      ),
    );
  }
}
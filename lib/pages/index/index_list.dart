import 'package:flutter/material.dart';
import 'package:itvolga/model/model_week.dart';
import 'index_item.dart';

class IndexList extends StatelessWidget {
  final List<Day> indexList;

  const IndexList({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: indexList.length,
      itemBuilder: (context, index) {
        return IndexItem(
          id: indexList[index].id, // Передаем id
          day: indexList[index].day,
          calories: indexList[index].calories,
          meals: indexList[index].meals,
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import '../../model/model_ meal.dart';
import 'reception_item.dart';

class ReceptionList extends StatelessWidget {
  final List<Meal> indexList;

  const ReceptionList({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.separated(
        itemCount: indexList.length,
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemBuilder: (context, index) {
          final meal = indexList[index];
          return ReceptionItem(
            title: meal.title,
            img: meal.urlImg,
            calories: meal.calories,
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:itvolga/pages/dishs/dish_item.dart';

class DishList extends StatelessWidget {
  final List<Map<String, dynamic>> indexList;

  const DishList({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: indexList.length,
      itemBuilder: (context, index) {
        final item = indexList[index];
        return DishItem(
          title: item['title'],
          img: item['img'],
          calories: item['calories'] ?? 0,
        );
      },
    );
  }
}
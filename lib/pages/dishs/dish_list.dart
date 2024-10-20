import 'package:flutter/material.dart';
import 'package:itvolga/pages/dishs/dish_item.dart';
import 'package:itvolga/model/model_dish.dart'; // Import the Dish model

class DishList extends StatelessWidget {
  final List<Dish> indexList; // Change the type to List<Dish>

  const DishList({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: indexList.length,
      itemBuilder: (context, index) {
        final dish = indexList[index];
        return DishItem(
          id: dish.id,
          dish: dish, // Pass the dish object
          title: dish.name,
          img: dish.imageUrl,
          calories:
              dish.calories ?? 0, // Provide a default value if calories is null
        );
      },
    );
  }
}

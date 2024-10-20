import 'dart:io';

import 'package:flutter/material.dart';
import 'package:itvolga/model/model_dish.dart';
import 'package:itvolga/pages/form_dish/Editform_dish_page.dart';
import 'package:itvolga/widgets/action_button.dart';
import '../../database/database_dish.dart';

class DishItem extends StatelessWidget {
  final Dish dish;
  final String title;
  final String img;
  final int calories;

  const DishItem(
      {required this.dish,
      required this.title,
      required this.img,
      required this.calories,
      required id});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 200,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.0020000000949949026),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFDDDDDD)),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 141,
            top: 48,
            child: SizedBox(
              width: 100,
              height: 20,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
          ),
          Positioned(
            left: 141,
            top: 77.50,
            child: SizedBox(
              width: 60,
              height: 16,
              child: Text(
                '$calories kcal',
                style: const TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 17.60,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ),
          ),
          Positioned(
            left: 21,
            top: 21,
            child: Container(width: 100, height: 100),
          ),
          Positioned(
            left: 21,
            top: 21,
            child: Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: _getImageProvider(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 265,
            top: 38,
            child: Column(
              children: [
                ActionButton(
                  text: 'Изменить',
                  color: Color(0xFF4CAF50),
                  onPressed: () {
                    // Переход к форме редактирования
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDishPage(dish: dish),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10), // Добавляем отступ между кнопками
                ActionButton(
                  text: 'Удалить',
                  color: Color(0xFFF24E1E),
                  onPressed: () async {
                    // Действие при нажатии на кнопку "Удалить"
                    await _deleteDish(context, dish);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteDish(BuildContext context, Dish dish) async {
    // Удаляем блюдо из базы данных
    await DishDatabase().deleteDish(dish.id!);

    // Удаляем изображение, если оно не является изображением по умолчанию
    if (!dish.imageUrl.startsWith('assets/img_user/breakfast.jpg')) {
      final file = File(dish.imageUrl);
      if (await file.exists()) {
        await file.delete();
      }
    }

    // Обновляем UI
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Блюдо удалено')),
    );

    // Обновляем список блюд
    Navigator.of(context).pop();
  }
}

ImageProvider _getImageProvider(String imagePath) {
  if (imagePath.startsWith('assets/')) {
    return AssetImage(imagePath);
  } else {
    return FileImage(File(imagePath));
  }
}

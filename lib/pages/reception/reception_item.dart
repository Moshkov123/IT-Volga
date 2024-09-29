import 'package:flutter/material.dart';

class ReceptionItem extends StatelessWidget {
  final int id; // Добавляем параметр id
  final String title;
  final String img;
  final int calories;

  const ReceptionItem({
    super.key,
    required this.id, // Добавляем параметр id
    required this.title,
    required this.img,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/dish',
          arguments: {'mealId': id}, // Передаем id приема пищи
        );
      },
      child: Container(
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
              child: Container(
                width: 100,
                height: 100,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
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
                      print('Изменить нажата');
                    },
                  ),
                  const SizedBox(height: 10),
                  ActionButton(
                    text: 'Удалить',
                    color: Color(0xFFF24E1E),
                    onPressed: () {
                      print('Удалить нажата');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(text),
    );
  }
}
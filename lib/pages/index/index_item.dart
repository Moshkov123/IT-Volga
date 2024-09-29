import 'package:flutter/material.dart';

class IndexItem extends StatelessWidget {
  final int id; // Добавляем id
  final String day;
  final int calories;
  final int meals;

  const IndexItem({super.key, required this.id, required this.day, required this.calories, required this.meals});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Переход с передачей параметров
        Navigator.pushNamed(
          context,
          '/reception',
          arguments: {'day': day, 'dayId': id}, // Передаем id
        );
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFDDDDDD)),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 5,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 110,
                height: 20,
                child: Text(
                  day,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0.17,
                  ),
                ),
              ),
              SizedBox(
                width: 94.61,
                height: 15,
                child: Text(
                  'Калории: $calories',
                  style: const TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.20,
                  ),
                ),
              ),
              SizedBox(
                width: 53.12,
                height: 16,
                child: Text(
                  'Meals: $meals',
                  style: const TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
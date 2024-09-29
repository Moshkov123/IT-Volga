import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OvalButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: ShapeDecoration(
          color: const Color(0xFF4CAF50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Большой радиус скругления для создания овала
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Прозрачный фон для кнопки
            shadowColor: Colors.transparent, // Прозрачная тень
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25), // Большой радиус скругления для создания овала
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
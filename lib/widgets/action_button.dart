import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10), // Добавляем отступ 10 пикселей
        child: Container(
          width: 80,
          height: 40,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.60,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:itvolga/pages/dishs/dish_page.dart';
import 'package:itvolga/pages/index/index_page.dart';
import 'package:itvolga/pages/reception/reception_page.dart'; // Добавьте этот импорт

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Используем home вместо маршрута '/'
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Трекер калорий',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF28A745),
        ),
        body: const IndexPage(), // По умолчанию открывается IndexPage
      ),
      routes: {
        '/reception': (context) => const ReceptionPage(),
        '/dish': (context) => const DishPage(),
      },
    );
  }
}


import 'package:flutter/material.dart';
import '../../database/database_meal.dart';
import '../../model/model_ meal.dart';
import 'reception_list.dart'; // Убедитесь, что путь к файлу правильный

class ReceptionPage extends StatelessWidget {
  const ReceptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем данные, переданные через аргументы
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String day = args?['day'] ?? 'No day';
    int dayId = args?['dayId'] ?? 1; // По умолчанию первый день

    return Scaffold(
      appBar: AppBar(
        title: Text('Прием пищи на $day'),
        centerTitle: true,
        backgroundColor: const Color(0xFF28A745),
      ),
      body: FutureBuilder<List<Meal>>(
        future: MealDatabaseHelper().getMealsForDay(dayId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No meals available'));
          } else {
            return ReceptionList(indexList: snapshot.data!);
          }
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:itvolga/pages/form_reception/form_reception_page.dart';
import 'package:itvolga/widgets/oval_button.dart';
import '../../database/database_meal.dart';
import '../../model/model_meal.dart';
import 'reception_list.dart';

class ReceptionPage extends StatelessWidget {
  const ReceptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String day = args?['day'] ?? 'No day';
    int dayId = args?['dayId'] ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Прием пищи на $day'),
        centerTitle: true,
        backgroundColor: const Color(0xFF28A745),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Meal>>(
              future: MealDatabaseHelper().getMealsForDay(dayId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text('Добавте, пожалуйста приемы пиши.'));
                } else {
                  return ReceptionList(meals: snapshot.data!);
                }
              },
            ),
          ),
          OvalButton(
            text: 'Добавить',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormReceptionPage(dayId: dayId),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

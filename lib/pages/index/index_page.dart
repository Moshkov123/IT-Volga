import 'package:flutter/material.dart';
import 'package:itvolga/database/database_week.dart';
import 'package:itvolga/model/model_week.dart';
import 'package:itvolga/pages/index/index_list.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Day>>(
        future: DatabaseWeek().getDays(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return IndexList(indexList: snapshot.data!);
          }
        },
      ),
    );
  }
}
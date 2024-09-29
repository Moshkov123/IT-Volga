class Day {
  int id;
  String day;
  int meals;
  int calories;

  Day({
    required this.id,
    required this.day,
    required this.meals,
    required this.calories,
  });

  // Преобразование объекта в Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'day': day,
      'meals': meals,
      'calories': calories,
    };
  }

  // Преобразование Map в объект
  factory Day.fromMap(Map<String, dynamic> map) {
    return Day(
      id: map['id'],
      day: map['day'],
      meals: map['meals'],
      calories: map['calories'],
    );
  }
}
class Meal {
  int id;
  String title;
  String urlImg;
  int calories;
  int dayId;

  Meal({
    required this.id,
    required this.title,
    required this.urlImg,
    required this.calories,
    required this.dayId,
  });

  // Преобразование объекта в Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url_img': urlImg,
      'calories': calories,
      'day_id': dayId,
    };
  }

  // Преобразование Map в объект
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      title: map['title'],
      urlImg: map['url_img'],
      calories: map['calories'],
      dayId: map['day_id'],
    );
  }
}
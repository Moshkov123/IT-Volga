class Meal {
  final int? id;
  final String title;
  final String urlImg;
  final int? calories;
  final int dayId;

  Meal({
    this.id,
    required this.title,
    required this.urlImg,
    this.calories,
    required this.dayId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url_img': urlImg,
      'calories': calories,
      'day_id': dayId,
    };
  }

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
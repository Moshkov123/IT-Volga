class Dish {
  final int? id;
  final String name;
  final int mealId;
  final String imageUrl;
  final int? calories; // Изменено на int?

  Dish({
    this.id,
    required this.name,
    required this.mealId,
    required this.imageUrl,
    this.calories, // Изменено на int?
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meal_id': mealId,
      'image_url': imageUrl,
      'calories': calories, // Изменено на int?
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'],
      name: map['name'],
      mealId: map['meal_id'],
      imageUrl: map['image_url'],
      calories: map['calories'], // Изменено на int?
    );
  }
}
class Food {
  String name;
  double price;
  String imagePath;
  String calories;
  String description;
  String cal;
  String gs;
  String ps;
  String fs;
  String cs;
  final String kcal = 'kcal';
  final String grams = 'grams';
  final String proteins = 'proteins';
  final String fats = 'fats';
  final String carbs = 'carbs';

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.calories,
    required this.description,
    required this.cal,
    required this.gs,
    required this.ps,
    required this.fs,
    required this.cs,
  });
}

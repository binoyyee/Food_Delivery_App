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

  // String get _name => name;
  // String get _price => price;
  // String get _imagePath => imagePath;
  // String get _calories => calories;
  // String get _description => description;
  // String get _cal => cal;
  // String get _gs => gs;
  // String get _ps => ps;
  // String get _fs => fs;
  // String get _cs => cs;
  // String get _kcal => kcal;
  // String get _grams => grams;
  // String get _proteins => proteins;
  // String get _fats => fats;
  // String get _carbs => carbs;
}

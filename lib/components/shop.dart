import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    //Poke with chicken using Soup photo
    Food(
      name: 'Poke with chicken',
      price: '47.00',
      imagePath: 'lib/images/Soup.png',
      calories: '325 Kcal',
      description:
          'Famous Hawaiian dish. Rice pillow with tender chicken breast, mushrooms, lettuce, cherry tomatoes, seaweed and corn, with unagi sauce.',
      cal: '325',
      gs: '420',
      ps: '21',
      fs: '19',
      cs: '65',
    ),

    //Salad with radishes, tomatoes and mushrooms using Dessert photo
    Food(
      name: 'Salad with radishes, tomatoes and mushrooms',
      price: '35.00',
      imagePath: 'lib/images/Indian-Chutney.png',
      calories: '225 Kcal',
      description: 'Classic Salad with Beans sauce',
      cal: '225',
      gs: '60',
      ps: '19',
      fs: '12',
      cs: '8',
    ),
  ];

  //customer cart
  List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to car
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

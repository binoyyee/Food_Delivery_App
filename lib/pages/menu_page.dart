import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:food_delivery_app/components/choice_list.dart';
import 'package:food_delivery_app/components/food.dart';
import 'package:food_delivery_app/components/food_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/popular_card.dart';
import '../components/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigate to food item details page

  // void navigateToFoodDetails(int index) {
  //   //get the shop and its menu
  //   final shop = context.read<Shop>();
  //   final foodMenu = shop.foodMenu;
  // }

  //food menu
  List foodMenu = [
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

  set setfoodMenu(List foodMenu) {
    _MenuPageState().foodMenu = foodMenu;
  }

  List get getfoodMenu => _MenuPageState().foodMenu;

  @override
  Widget build(BuildContext context) {
    //get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          CupertinoIcons.bars,
          color: Colors.grey[900],
          size: 30,
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: TopAddBar(
            text: 'Keus Office   •    24 mins',
            onTap: () {},
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            CupertinoIcons.search_circle_fill,
            color: const Color.fromARGB(255, 41, 41, 41),
            size: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //shrinkWrap: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Hits of the week
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 0, 0),
              child: Text(
                'Hits of the week',
                style: GoogleFonts.roboto(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 31, 31, 31),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const PopularCard(),

            const SizedBox(height: 30),

            const ChoiceList(),

            //food menu

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

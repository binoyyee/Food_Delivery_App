import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:food_delivery_app/components/choice_list.dart';
import 'package:food_delivery_app/components/food.dart';
import 'package:food_delivery_app/components/food_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import '../components/floating_cart_card.dart';
import '../components/popular_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late CarouselController _controller;
  int currentIndex = 0;

  //Logic for carousel
  void nextItem() {
    _controller.nextPage();
    setState(() {
      currentIndex += 1;
    });
  }

  void prevItem() {
    _controller.previousPage();
    setState(() {
      currentIndex -= 1;
    });
  }

  //Cart Bucket Logic
  List<Food> cart = []; //Cart = List of Food, Initially empty
  double totalCost = 0; //Cart cost initial = 0

  //Logic for adding food in cart
  void addItem(Food item) => setState(() {
        cart.add(item);
        calculateCost();
      });

  //Logic for removing food from cart
  void removeItem(Food item) => setState(() {
        cart.remove(item);
        calculateCost();
      });

  //Logic for calculating new total cost
  void calculateCost() {
    setState(() {
      totalCost = cart.fold(
          0.00, (previousValue, element) => previousValue + element.price);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = CarouselControllerImpl();
    calculateCost();
  }

  //food menu used to display verticle food list
  List foodMenu = [
    //Poke with chicken using Soup photo
    Food(
      name: 'Poke with chicken',
      price: 47.00,
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
      price: 35.00,
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

  //Used in carousel cards
  List<Food> popular = [
    Food(
      name: 'Two slices of pizza \nwith delicious salami',
      price: 12.40,
      imagePath: 'lib/images/Salad2.png',
      calories: '225 Kcal',
      description: 'Classic Salad with Beans sauce',
      cal: '225',
      gs: '60',
      ps: '19',
      fs: '12',
      cs: '8',
    ),
    Food(
      name: 'Salad with Egg,\nCheese and Shrimps',
      price: 9.25,
      imagePath: 'lib/images/Pizza.png',
      calories: '225 Kcal',
      description: 'Classic Salad with Beans sauce',
      cal: '225',
      gs: '60',
      ps: '19',
      fs: '12',
      cs: '8',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //Logic - When cart is empty, it is not displayed
      bottomNavigationBar: cart.isNotEmpty
          ? FloatingCartCard(
              totalCost: totalCost,
              cart: cart,
              removeAction: removeItem,
            )
          : null,
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
        actions: const [
          Icon(
            CupertinoIcons.search_circle_fill,
            color: Color.fromARGB(255, 41, 41, 41),
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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

            CarouselSlider(
              carouselController: _controller,
              items: popular
                  .map(
                    (e) => PopularCard(
                      fromC: const Color.fromARGB(255, 170, 215, 255),
                      toC: const Color.fromARGB(255, 209, 182, 255),
                      name: e.name,
                      price: e.price,
                      image: e.imagePath,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                aspectRatio: 16 / 9,
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: CarouselIndicator(
                space: 10,
                count: 4,
                index: currentIndex,
                color: Colors.grey,
                activeColor: Colors.black,
              ),
            ),

            const SizedBox(height: 30),

            const ChoiceList(),

            //food menu

            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), //List within SingleChildScrollView, hence need this for expected behaviour
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onAddAction: addItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:food_delivery_app/components/choice_list.dart';
import 'package:food_delivery_app/components/food.dart';
import 'package:food_delivery_app/components/food_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

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

  List<double> cart = [45];
  double totalCost = 0;

  void addItem(double item) => setState(() {
        cart.add(item);
        calculateCost();
      });

  void calculateCost() {
    setState(() {
      totalCost =
          cart.fold(0.00, (previousValue, element) => previousValue + element);
    });
  }

  @override
  void initState() {
    super.initState();
    calculateCost();
  }

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
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar:
          cart.isNotEmpty ? FloatingCartCard(totalCost: totalCost) : null,
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

            CarouselSlider(
              carouselController: CarouselController(),
              items: [
                const PopularCard(),
                const PopularCard(),
                const PopularCard(),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
              ),
            ),

            Center(
              child: CarouselIndicator(
                count: 3,
                index: 1,
                color: Colors.grey,
                activeColor: Colors.black,
              ),
            ),

            const SizedBox(height: 30),

            const ChoiceList(),

            //food menu

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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

class FloatingCartCard extends StatelessWidget {
  const FloatingCartCard({
    super.key,
    required this.totalCost,
  });

  final double totalCost;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          canvasColor: Colors.transparent,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          useSafeArea: true,
          isScrollControlled: true,
          context: context,
          showDragHandle: true,
          builder: (context) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.payment_rounded,
                          size: 26,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Apple pay',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                          size: 14,
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 34,
                      ),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pay",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "24 min",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "•",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '\$${totalCost.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                shrinkWrap: true,
                children: [
                  Text(
                    'We will deliver in \n24 minutes to the address:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Text(
                        '100a Ealing Rd',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Change Address',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/images/Soup.png',
                        height: 80,
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Poke with chicken \nand corn',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //quantity
                              //minus button
                              IconButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 240, 240, 240),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),

                              //quantity count
                              SizedBox(
                                //width: 25,
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              //plus button
                              IconButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 240, 240, 240),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        '\$47.00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Text(
                        'Cutlery',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //quantity
                          //minus button
                          IconButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 240, 240, 240),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),

                          //quantity count
                          SizedBox(
                            //width: 25,
                            child: Center(
                              child: Text(
                                '1',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          //plus button
                          IconButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 240, 240, 240),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Free delivery from \$30',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '\$0.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(16),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Text(
                "24 min",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "•",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '\$${totalCost.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

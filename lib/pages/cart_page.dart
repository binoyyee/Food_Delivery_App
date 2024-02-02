//import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
    required this.totalCost,
    required this.cart,
    required this.removeAction,
  });

  final List<Food> cart;
  final double totalCost;
  final Function(Food) removeAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Row(
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
              margin: const EdgeInsets.symmetric(
                vertical: 34,
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "24 min",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "•",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '\$${totalCost.toStringAsFixed(2)}',
                    style: const TextStyle(
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        shrinkWrap: true,
        children: [
          const Text(
            'We will deliver in \n24 minutes to the address:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Row(
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
          const SizedBox(
            height: 32,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            //Logic to implement display of all food items in cart
            //For every food in cart, it will create cartItem of food
            //List of food converted to List of Cart Item (widgets)
            children: cart
                .map((food) => CartItem(food: food, removeAction: removeAction))
                .toList(),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const SizedBox(
                width: 80,
                height: 80,
                child: Icon(
                  Icons.restaurant,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 26,
              ),
              const Text(
                'Cutlery',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //quantity
                  //minus button
                  IconButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: const MaterialStatePropertyAll(
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
                  const SizedBox(
                    //width: 25,
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  //plus button
                  IconButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: const MaterialStatePropertyAll(
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
          const SizedBox(
            height: 32,
          ),
          const Row(
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
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.food,
    required this.removeAction,
  });

  final Food food;
  final Function(Food) removeAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            food.imagePath,
            height: 80,
          ),
          const SizedBox(
            width: 26,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //quantity
                    //minus button
                    IconButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 240, 240, 240),
                        ),
                      ),
                      onPressed: () => removeAction(food),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),

                    //quantity count
                    const SizedBox(
                      //width: 25,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    //plus button
                    IconButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor: const MaterialStatePropertyAll(
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
          ),
          Text(
            '\$${food.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

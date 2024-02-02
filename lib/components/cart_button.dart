//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:food_delivery_app/components/food.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.decrementQuantity,
    required this.incrementQuantity,
    required this.quantityCount,
    required this.onAddAction,
    required this.food,
  });

  final VoidCallback decrementQuantity;
  final VoidCallback incrementQuantity;
  final int quantityCount;
  final Food food;
  final Function(Food) onAddAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //color: Colors.transparent,
            height: 60,
            width: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 224, 224, 224)),
            //color: const Color.fromARGB(255, 0, 0, 0),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //quantity
                //minus button
                IconButton(
                  onPressed: decrementQuantity,
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.grey,
                  ),
                ),

                //quantity count
                SizedBox(
                  //width: 25,
                  child: Center(
                    child: Text(
                      quantityCount.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                //plus button
                IconButton(
                  onPressed: incrementQuantity,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          //Add to cart button
          Expanded(
            child: AddToCart(
                onTap: () {
                  onAddAction(food);
                  Navigator.of(context).pop();
                },
                text: '\$${food.price.toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}

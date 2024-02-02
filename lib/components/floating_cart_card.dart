//import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/food.dart';
import 'package:food_delivery_app/pages/cart_page.dart';

class FloatingCartCard extends StatelessWidget {
  const FloatingCartCard({
    super.key,
    required this.totalCost, required this.cart, required this.removeAction,
  });

  final double totalCost;
  final List<Food> cart;
  final Function(Food) removeAction;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          canvasColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
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
            child: CartPage(totalCost: totalCost, cart: cart, removeAction: removeAction),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cart",
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
      ),
    );
  }
}

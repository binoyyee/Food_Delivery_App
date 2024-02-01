import 'package:flutter/material.dart';
//import 'package:food_delivery_app/components/food.dart';
//import 'package:food_delivery_app/pages/menu_page.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 195, 228, 255),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 202, 202, 202),
            ),
            borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text
            Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 34, 63),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(
              width: 10,
            ),
            //icon
            const Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 0, 34, 63),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoCostButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const PromoCostButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 41, 41, 41),
            borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text
            Text(
              text,
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }
}

class TopAddBar extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const TopAddBar({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 26, 26, 26),
            borderRadius: BorderRadius.circular(80)),
        padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //text
            Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodTileCost extends StatelessWidget {
  final String text;

  const FoodTileCost({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(80)),
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //text
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 26, 26, 26),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class AddToCart extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const AddToCart({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //color: Colors.transparent,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.black),
        //color: const Color.fromARGB(255, 0, 0, 0),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Add to cart",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

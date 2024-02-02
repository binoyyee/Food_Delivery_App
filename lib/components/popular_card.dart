import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/gradient_card.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
    required this.fromC,
    required this.toC,
    required this.name,
    required this.price,
    required this.image,
  });

  final Color fromC;
  final Color toC;
  final String name;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 270,
      child: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          bottom: 0,
          child: GradientCard(
            fromC: fromC,
            toC: toC,
            name: name,
            price: price,
          ),
        ),
        Positioned(
          top: -1,
          child: Image.asset(
            image,
            height: 146,
          ),
        ),
      ]),
    );
  }
}

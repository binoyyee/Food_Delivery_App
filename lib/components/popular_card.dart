import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/gradient_card.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 270,
      child: Stack(alignment: Alignment.topCenter, children: [
        const Positioned(
          bottom: 0,
          child: GradientCard(),
        ),
        Positioned(
          top: -1,
          //left: 110,

          child: Image.asset(
            'lib/images/Salad2.png',
            height: 170,
          ),
        ),
      ]),
    );
  }
}

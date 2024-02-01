import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:food_delivery_app/components/food.dart';
import 'package:food_delivery_app/pages/poke_chick.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:food_delivery_app/pages/menu_page.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final Function(double) onAddAction;

  const FoodTile({super.key, required this.food, required this.onAddAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
          barrierColor: Colors.black.withOpacity(0.7),
          showDragHandle: true,
          enableDrag: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return PokeChick(food: food, onAddAction: onAddAction);
          },
        );
      },
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        // margin: const EdgeInsets.symmetric(
        //   vertical: 1,
        //   horizontal: 1,
        // ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            //image
            Image.asset(
              food.imagePath,
              height: 180,
            ),
            const SizedBox(
              width: 15,
            ),
            //text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    food.name,
                    softWrap: true,
                    style: GoogleFonts.roboto(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    FoodTileCost(
                      text: '\$${food.price}'
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      food.calories,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

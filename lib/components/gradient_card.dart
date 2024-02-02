import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({
    super.key,
    required this.fromC,
    required this.toC,
    required this.name,
    required this.price,
  });

  final Color fromC;
  final Color toC;
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(1),
        height: 216,
        width: 375,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [fromC, toC],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        //margin: const EdgeInsets.symmetric(horizontal: 15),
        //padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 144, 0, 0),
                    child: Text(
                      name,
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 31, 31, 31),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 144, 20, 0),
                  child: PromoCostButton(
                    text: "\$${price.toStringAsFixed(2)}",
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

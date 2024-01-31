import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 258,
      width: 375,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 170, 215, 255),
            Color.fromARGB(255, 209, 182, 255),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      //margin: const EdgeInsets.symmetric(horizontal: 15),
      //padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 180, 0, 25),
                child: Text(
                  '''Two slices of pizza 
with delicious salami''',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 31, 31, 31),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 180, 20, 25),
                child: PromoCostButton(
                  text: "\$12.40",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

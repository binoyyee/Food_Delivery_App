import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //get started button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(35, 35, 35, 35),
        child: MyButton(
          text: "Get Started",
          onTap: () {
            //go to menu page
            Navigator.pushNamed(context, '/menupage');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),

            Text(
              "Food for everyone",
              style: GoogleFonts.lexendDeca(
                  height: 0.9,
                  fontSize: 52,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 0),

            //Food Image
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset('lib/images/Dessert.png'),
            ),
          ],
        ),
      ),
    );
  }
}

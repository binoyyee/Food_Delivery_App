import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            //Keus Name
            Text(
              "KEUS FOODS",
              style: GoogleFonts.robotoSlab(
                  fontSize: 38,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 0),

            //icon
            Card(
              child: Container(
                color: const Color.fromARGB(25, 24, 151, 255),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset('lib/images/Fruits-Plate.png'),
                ),
              ),
            ),

            const SizedBox(height: 25),

            //title
            Text(
              "on-the-go",
              style: GoogleFonts.robotoSerif(
                  fontSize: 44,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            //subtitle
            Text(
              '''Feel the freshness with each bite,
Anywhere
Anytime''',
              style: GoogleFonts.robotoSlab(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  height: 2,
                  fontSize: 16),
            ),

            const SizedBox(
              height: 15,
            ),
            //get started button
            MyButton(
              text: "Get Started",
              onTap: () {
                //go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class CarouselBottomTitleWidget extends StatelessWidget {
  const CarouselBottomTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ' EXOTIC VINTAGE \n& PREMIUM CARS',
          style: GoogleFonts.playfairDisplay(
              fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          'The premium marketplace to buy & sell',
          style: GoogleFonts.roboto(
              fontSize: 8, fontWeight: FontWeight.bold, color: kGray),
        ),
        const SizedBox(height: 4),
        Text(
          'Classic and Exotic cars.',
          style: GoogleFonts.playfairDisplay(
              fontSize: 8, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}

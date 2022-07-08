import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class MontserratCustom extends StatelessWidget {
  const MontserratCustom({
    Key? key,
    required this.text,
    this.size = 14,
    this.weight = FontWeight.w600,
    this.color = kBlack,
  }) : super(key: key);

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}

SizedBox kHeight25 = const SizedBox(height: 25);
SizedBox kHeight15 = const SizedBox(height: 15);
SizedBox kHeight10 = const SizedBox(height: 10);
SizedBox kwidth10 = const SizedBox(width: 10);
SizedBox kHeight8 = const SizedBox(height: 8);
SizedBox kwidth8 = const SizedBox(width: 8);

EdgeInsets constFilterPadding = const EdgeInsets.only(
  top: 6,
  left: 13,
  bottom: 10,
  right: 13,
);

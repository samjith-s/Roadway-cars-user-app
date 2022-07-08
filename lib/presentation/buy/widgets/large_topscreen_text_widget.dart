import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class LargeTopTextWidget extends StatelessWidget {
  final String text;
  const LargeTopTextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 15, bottom: 20),
      child: Text(
        text,
        style: GoogleFonts.playfairDisplay(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: kBlack,
        ),
      ),
    );
  }
}

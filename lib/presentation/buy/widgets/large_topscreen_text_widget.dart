import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeTopTextWidget extends StatelessWidget {
  final String text;
  const LargeTopTextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 20),
      child: Text(
        text,
        style: GoogleFonts.playfairDisplay(
            fontSize: 41, fontWeight: FontWeight.bold),
      ),
    );
  }
}

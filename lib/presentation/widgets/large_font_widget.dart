import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeFont extends StatelessWidget {
  final String text;
  const LargeFont({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lobsterTwo(fontSize: 44),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 30),
      child: ElevatedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: kGreen,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Apply',
          style: GoogleFonts.lato(fontSize: 18),
        ),
      ),
    );
  }
}

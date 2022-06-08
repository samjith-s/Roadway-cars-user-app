import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class AppBlueIconButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double width;

  const AppBlueIconButton({
    required this.text,
    required this.width,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: kGreen,
        ),
        width: width,
        height: MediaQuery.of(context).size.height * .07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kWhite,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const CircleAvatar(
              backgroundColor: kYellow,
              radius: 14,
              child: Icon(Icons.keyboard_double_arrow_right),
            )
          ],
        ),
      ),
    );
  }
}

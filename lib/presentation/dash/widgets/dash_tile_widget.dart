
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class CustomDashTilewidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData leading;
  final IconData tailing;
  const CustomDashTilewidget({
    required this.title,
    required this.subTitle,
    required this.leading,
    this.tailing = Icons.keyboard_double_arrow_right,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kLightColor.withOpacity(.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Stack(
                    children: [
                      const Align(
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: kYellow,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Icon(leading),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.lato(fontSize: 17),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subTitle,
                      style: GoogleFonts.lato(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                tailing,
              ),
            )
          ],
        ),
      ),
    );
  }
}
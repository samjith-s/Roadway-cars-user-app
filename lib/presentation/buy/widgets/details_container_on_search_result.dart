import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/buy/screens/vehicle_details_screen.dart';

class TransparentDetailsContainerWidget extends StatelessWidget {
  final String detailValue;
  final int detailIconIndex;
  const TransparentDetailsContainerWidget({
    required this.detailIconIndex,
    required this.detailValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(
        horizontal: 7.5,
        vertical: 10,
      ),
      width: (MediaQuery.of(context).size.width - 100) / 4,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: kWhite),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(iconsList[detailIconIndex]),
            width: 20,
            color: kWhite,
          ),
          Text(
            detailValue,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: kWhite,
            ),
          ),
        ],
      ),
    );
  }
}

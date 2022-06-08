import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhite,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu, color: kBlack),
      ),
      title: Text(
        'RoadWay',
        style: GoogleFonts.berkshireSwash(fontSize: 25, color: kBlack),
      ),
      centerTitle: true,
      actions: [
        CircleAvatar(
          backgroundColor: kGray,
          radius: 13,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: kBlack,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}

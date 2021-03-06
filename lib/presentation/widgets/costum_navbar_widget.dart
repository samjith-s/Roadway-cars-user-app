import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNavBar extends StatefulWidget {
  final Function changeScreen;
  const CustomNavBar({required this.changeScreen, Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 70,
      margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        color: kWhite.withOpacity(.9),
        borderRadius: BorderRadius.circular(25),
      ),
      child: SalomonBottomBar(
        selectedColorOpacity: 1,
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
          widget.changeScreen(i);
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home,
              color: kBlack,
            ),
            title:  Text(
              "Home",
              style: GoogleFonts.hind(color: kBlack),
            ),
            selectedColor:Color.fromARGB(255, 237, 150, 21),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.car,
              color: kBlack,
              size: 20,
            ),
            title:  Text(
              "Buy",
              style: GoogleFonts.hind(color: kBlack),
            ),
            selectedColor: Color.fromARGB(255, 237, 150, 21),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.sell,
              color: kBlack,
            ),
            title:  Text(
              "Sell",
              style: GoogleFonts.hind(color: kBlack),
            ),
            selectedColor: Color.fromARGB(255, 237, 150, 21),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.person,
              color: kBlack,
            ),
            title:  Text(
              "Dash",
              style: GoogleFonts.hind(color: kBlack),
            ),
            selectedColor: Color.fromARGB(255, 237, 150, 21),
          ),
        ],
      ),
    );
  }
}

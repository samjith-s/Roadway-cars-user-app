import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class FilterBottomSheetSideBarWidget extends StatelessWidget {
  const FilterBottomSheetSideBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      alignment: Alignment.topCenter,
      // decoration: const BoxDecoration(
      //   color: kGray,
      // ),
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          navBarItems.length,
          (index) => ConfigurableFilterNavItem(
            index: index,
          ),
        ),
      ),
    );
  }
}

class ConfigurableFilterNavItem extends StatelessWidget {
  const ConfigurableFilterNavItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedNavIemIndex,
      builder: (BuildContext context, int value, Widget? child) {
        return GestureDetector(
          onTap: () => selectedNavIemIndex.value = index,
          child: Container(
            padding: const EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            width: 120,
            height: 50,
            color: value == index ? kWhite : darkGrey,
            child: Text(
              navBarItems[index],
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: value == index ? kBlack : kWhite, //value == index ? kWhite : kBlack,
              ),
            ),
          ),
        );
      },
    );
  }
}

ValueNotifier<int> selectedNavIemIndex = ValueNotifier(0);

List<String> navBarItems = [
  'Brands',
  'Budget',
  'Segments',
  'Bodytypes',
  'By Fuel',
  "By Year",
  "No's Owners",
];

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

ValueNotifier<int> selectedBudgetIndex = ValueNotifier(-1);

class TotalBudgetSelectionView extends StatelessWidget {
  const TotalBudgetSelectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: constFilterPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MontserratCustom(
            text: 'Choose from options below',
          ),
          kHeight25,
          Column(
            children: List.generate(
              6,
              (index) => FilterBudgetListItemWidget(
                text: budgetOptions[index],
                index: index,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FilterBudgetListItemWidget extends StatelessWidget {
  const FilterBudgetListItemWidget({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  final String text;

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final i = totalSelectedFilters.value.indexWhere(
          (element) => element.itemType == 'budget',
        );
        if (i != -1) {
          totalSelectedFilters.value.removeAt(i);
          totalSelectedFilters.notifyListeners();
        }
        final item = FilterItem(
          itemType: 'budget',
          itemName: budgetOptions[index],
          onRemoved: () {
            selectedBudgetIndex.value = -1;
            selectedBudgetIndex.notifyListeners();
            totalSelectedFilters.value.removeWhere(
              (element) => element.itemType == 'budget',
            );
            totalSelectedFilters.notifyListeners();
          },
        );
        selectedBudgetIndex.value = index;
        selectedBudgetIndex.notifyListeners();
        totalSelectedFilters.value.add(item);
        totalSelectedFilters.notifyListeners();
      },
      child: ValueListenableBuilder(
        valueListenable: selectedBudgetIndex,
        builder: (BuildContext context, int value, Widget? child) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width - 120,
            decoration: BoxDecoration(
              color: value == index ? kGreen : kWhite,
              border: Border.all(color: value == index ? kYellow : darkGrey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: value == index ? kWhite : kBlack,
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> budgetOptions = [
  'Below 10 Lac',
  "10 Lac - 25 Lac",
  '25 Lac - 50 Lac',
  '50 Lac - 75 Lac',
  '75 Lac - 1 Cr',
  '1 Cr and Above',
];

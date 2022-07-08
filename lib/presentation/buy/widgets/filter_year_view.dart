import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

class YearFilterOptionsViewWidget extends StatelessWidget {
  const YearFilterOptionsViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: constFilterPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MontserratCustom(text: 'Choose from options below'),
          kHeight25,
          Column(
            children: List.generate(
              yearOptions.length,
              (index) => GestureDetector(
                onTap: () {
                  final i = totalSelectedFilters.value.indexWhere(
                    (element) => element.itemType == 'year',
                  );
                  if (i != -1) {
                    totalSelectedFilters.value.removeAt(i);
                    totalSelectedFilters.notifyListeners();
                  }
                  final item = FilterItem(
                    itemType: 'year',
                    itemName: yearOptions[index],
                    onRemoved: () {
                      selectedYearIndex.value = -1;
                      selectedYearIndex.notifyListeners();
                      totalSelectedFilters.value.removeWhere(
                        (element) => element.itemType == 'year',
                      );
                      totalSelectedFilters.notifyListeners();
                    },
                  );
                  selectedYearIndex.value = index;
                  selectedYearIndex.notifyListeners();
                  totalSelectedFilters.value.add(item);
                  totalSelectedFilters.notifyListeners();
                },
                child: ValueListenableBuilder(
                  valueListenable: selectedYearIndex,
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
                      child: MontserratCustom(
                        text: yearOptions[index],
                        color: value == index ? kWhite : kBlack,
                        weight: FontWeight.w400,
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

ValueNotifier<int> selectedYearIndex = ValueNotifier(-1);

List<String> yearOptions = [
  'Under 3 Years',
  'Under 5 Years',
  'Under 7 Years',
  'Under 9 Years',
  '10 Years and Above',
];

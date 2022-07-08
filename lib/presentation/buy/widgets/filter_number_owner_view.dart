import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

ValueNotifier<List<String>> selectedOwnerOptions = ValueNotifier([]);

class FilterOwnerOptionsView extends StatelessWidget {
  const FilterOwnerOptionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 6,
            left: 15,
            bottom: 10,
          ),
          child: MontserratCustom(
            text: 'Choose from options below',
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final owners = ownerOptions[index];
            return ValueListenableBuilder(
              valueListenable: selectedOwnerOptions,
              builder: (BuildContext context, List<String> value, Widget? child) {
                return Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                          width: 1.0,
                          color: kBlack,
                        ),
                      ),
                      checkColor: kBlack,
                      fillColor: MaterialStateProperty.all(
                        kWhite,
                      ),
                      value: value.contains(owners),
                      onChanged: (selected) {
                        if (value.contains(owners)) {
                          selectedOwnerOptions.value.remove(owners);
                          totalSelectedFilters.value.removeWhere((element) => element.itemName == owners);
                          totalSelectedFilters.notifyListeners();
                          selectedOwnerOptions.notifyListeners();
                        } else {
                          selectedOwnerOptions.value.add(owners);
                          selectedOwnerOptions.notifyListeners();
                          totalSelectedFilters.value.add(
                            FilterItem(
                              itemType: 'owner',
                              itemName: owners,
                              onRemoved: () {
                                selectedOwnerOptions.value.remove(owners);
                                totalSelectedFilters.value.removeWhere((element) => element.itemName == owners);
                                selectedOwnerOptions.notifyListeners();
                                totalSelectedFilters.notifyListeners();
                              },
                            ),
                          );
                          totalSelectedFilters.notifyListeners();
                        }
                      },
                    ),
                    Text(owners),
                  ],
                );
              },
            );
          },
          itemCount: ownerOptions.length,
        )
      ],
    );
  }
}

List<String> ownerOptions = [
  'First',
  'Second',
  'Third',
  'Fourth',
  'More than Four',
];

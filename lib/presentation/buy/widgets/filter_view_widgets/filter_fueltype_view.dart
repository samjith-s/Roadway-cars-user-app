import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

ValueNotifier<List<String>> selectedFuelTypeOptions = ValueNotifier([]);

class FilterFuelTypeOptionsView extends StatelessWidget {
  const FilterFuelTypeOptionsView({
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
            final furlType = fuelTypeOptions[index];
            return ValueListenableBuilder(
              valueListenable: selectedFuelTypeOptions,
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
                      value: value.contains(furlType),
                      onChanged: (selected) {
                        if (value.contains(furlType)) {
                          selectedFuelTypeOptions.value.remove(furlType);
                          totalSelectedFilters.value.removeWhere((element) => element.itemName == furlType);
                          totalSelectedFilters.notifyListeners();
                          selectedFuelTypeOptions.notifyListeners();
                        } else {
                          selectedFuelTypeOptions.value.add(furlType);
                          selectedFuelTypeOptions.notifyListeners();
                          totalSelectedFilters.value.add(
                            FilterItem(
                              itemType: 'fuel',
                              itemName: furlType,
                              onRemoved: () {
                                selectedFuelTypeOptions.value.remove(furlType);
                                totalSelectedFilters.value.removeWhere((element) => element.itemName == furlType);
                                selectedFuelTypeOptions.notifyListeners();
                                totalSelectedFilters.notifyListeners();
                              },
                            ),
                          );
                          totalSelectedFilters.notifyListeners();
                        }
                      },
                    ),
                    Text(furlType),
                  ],
                );
              },
            );
          },
          itemCount: fuelTypeOptions.length,
        )
      ],
    );
  }
}

List<String> fuelTypeOptions = [
  'Petrol',
  'Diesel',
  'Electric',
  'CNG',
  'LPG',
  'Hybrid',
];

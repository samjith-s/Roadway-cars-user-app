import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

class SegmentsFilterOptionsViewWidget extends StatelessWidget {
  const SegmentsFilterOptionsViewWidget({
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
          BlocBuilder<BuyScreenBloc, BuyScreenState>(
            builder: (context, state) {
              return Column(
                children: List.generate(
                  state.segmentsList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      final i = totalSelectedFilters.value.indexWhere(
                        (element) => element.itemType == 'segment',
                      );
                      if (i != -1) {
                        totalSelectedFilters.value.removeAt(i);
                        totalSelectedFilters.notifyListeners();
                      }
                      final item = FilterItem(
                        itemType: 'segment',
                        itemName: state.segmentsList[index].segmentName,
                        onRemoved: () {
                          selectedSegmentIndex.value=-1;
                          selectedSegmentIndex.notifyListeners();
                          totalSelectedFilters.value.removeWhere(
                            (element) => element.itemType == 'segment',
                          );
                          totalSelectedFilters.notifyListeners();
                        },
                      );
                      selectedSegmentIndex.value = index;
                      selectedSegmentIndex.notifyListeners();
                      totalSelectedFilters.value.add(item);
                      totalSelectedFilters.notifyListeners();
                    },
                    child: ValueListenableBuilder(
                      valueListenable: selectedSegmentIndex,
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
                            text: state.segmentsList[index].segmentName,
                            color: value == index ? kWhite : kBlack,
                            weight: FontWeight.w400,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

ValueNotifier<int> selectedSegmentIndex = ValueNotifier(-1);

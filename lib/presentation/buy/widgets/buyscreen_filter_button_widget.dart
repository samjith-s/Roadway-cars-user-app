import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';
import 'package:roadway/presentation/buy/widgets/filter_sheet_buttons_row.dart';
import 'package:roadway/presentation/buy/widgets/filter_sidebar_custom_widget.dart';
import 'package:roadway/presentation/buy/widgets/selected_filterlist_show_listview.dart';

class BuyScreenFilterButtonWidget extends StatelessWidget {
  const BuyScreenFilterButtonWidget({
    Key? key,
    required this.onApplied,
  }) : super(key: key);
  final void Function()? onApplied;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: kWhite,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 30,
                      bottom: 6,
                    ),
                    child: Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 20,
                              color: kGreen,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'FILTERS ',
                              ),
                              TextSpan(
                                text: '&',
                                style: TextStyle(color: kYellow, fontSize: 15),
                              ),
                              TextSpan(
                                text: ' SORT',
                                style: TextStyle(color: kOrenge),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: MontserratCustom(
                      text: 'Selected filters',
                    ),
                  ), //
                  ////////////////////////////////////////////////////////////////
                  const SelectedFilterShowListViewWidget(), ////////////////////////////////////////////////////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FilterBottomSheetSideBarWidget(), ////////////////////////////////////////////////////////////////////////////////////////////
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: MediaQuery.of(context).size.height * .45,
                        child: ValueListenableBuilder(
                          valueListenable: selectedNavIemIndex,
                          builder: (BuildContext context, int index, Widget? child) {
                            return correspondingWidgetsList[index];
                          },
                        ),
                      )
                    ],
                  ),
                  FilterButtonsRowWidget(
                    onPressed: onApplied,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(
        Icons.filter_alt,
        color: kBlack,
      ),
    );
  }
}

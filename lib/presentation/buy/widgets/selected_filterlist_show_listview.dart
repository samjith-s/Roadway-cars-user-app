import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

class SelectedFilterShowListViewWidget extends StatelessWidget {
  const SelectedFilterShowListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        bottom: 6,
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 100,
        ),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            ValueListenableBuilder(
              valueListenable: totalSelectedFilters,
              builder: (BuildContext context, List<FilterItem> value, Widget? child) {
                return Wrap(
                  children: List.generate(
                    totalSelectedFilters.value.length,
                    (index) {
                      final item = totalSelectedFilters.value[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 6,
                          bottom: 6,
                        ),
                        child: Chip(
                          // padding: EdgeInsets.zero,
                          label: Text(
                            item.itemName,
                            style: GoogleFonts.roboto(fontSize: 12),
                          ),
                          onDeleted: item.onRemoved,
                          backgroundColor: kGray,
                          deleteIcon: const Icon(Icons.close, size: 15),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

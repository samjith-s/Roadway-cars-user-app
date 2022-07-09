import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';
import 'package:roadway/presentation/buy/widgets/filter_view_widgets/filter_bodytype_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_view_widgets/filter_brands_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_view_widgets/filter_budget_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_view_widgets/filter_fueltype_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_view_widgets/filter_number_owner_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_view_widgets/filter_segments_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_view_widgets/filter_year_view.dart';

import '../../../../core/constants/colors.dart';

class FilterButtonsRowWidget extends StatelessWidget {
  const FilterButtonsRowWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: darkGrey,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ), // and this
              ),
              onPressed: () {
                totalSelectedFilters.value.clear();
                selectedBrands.value.clear();
                selectedBodyTypeIndex.value = -1;
                selectedBudgetIndex.value = -1;
                selectedSegmentIndex.value = -1;
                selectedFuelTypeOptions.value.clear();
                selectedOwnerOptions.value.clear();
                selectedYearIndex.value = -1;
                BlocProvider.of<BuyScreenBloc>(context).add(const GetAllVehicles());
                Navigator.of(context).pop();
              },
              child: Text(
                'Clear all',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: kGreen,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ), // and this
              ),
              onPressed: onPressed,
              child: Text(
                'Apply',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

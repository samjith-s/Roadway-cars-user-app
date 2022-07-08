import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/application/internet/internet_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/core/toast.dart';
import 'package:roadway/presentation/buy/screens/search_result_seeall_sceen.dart';
import 'package:roadway/presentation/buy/widgets/buyscreen_filter_button_widget.dart';
import 'package:roadway/presentation/buy/widgets/filter_brands_view.dart';
import 'package:roadway/presentation/buy/widgets/available_vehicles_gridview_widget.dart';
import 'package:roadway/presentation/buy/widgets/filter_bodytype_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_budget_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_fueltype_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_number_owner_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_segments_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_year_view.dart';
import 'package:roadway/presentation/buy/widgets/large_topscreen_text_widget.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<BuyScreenBloc>(context).add(const GetAllVehicles());
    });
    return Scaffold(
      body: BlocBuilder<BuyScreenBloc, BuyScreenState>(
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, netstate) {
                    if (!netstate.networkOn) {
                      showToast(
                        msg: 'No network connection. Please check your network',
                        bgcolor: kBlack,
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const LargeTopTextWidget(
                  text: 'You Belong\nHere.',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<BuyScreenBloc>(context).add(const GetAllVehicles());
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SearchResultSeeAllScreen(
                            focusOn: true,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kWhite,
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 48,
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          Text(
                            "Find your favorate car..",
                            style: GoogleFonts.poppins(color: kGray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const CustomSearchFieldWidget(),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14,
                              width: 5,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 237, 150, 21),
                                borderRadius: BorderRadius.only(
                                    // topRight: Radius.circular(5),
                                    // bottomRight: Radius.circular(5),
                                    ),
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'Available Vehicles',
                              style: GoogleFonts.hind(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ),
                        BuyScreenFilterButtonWidget(
                          onApplied: () {
                            var brands = selectedBrands.value.isNotEmpty ? selectedBrands.value : null;
                            var fuels = selectedFuelTypeOptions.value.isNotEmpty ? selectedFuelTypeOptions.value : null;
                            Budget? budget =
                                selectedBudgetIndex.value != -1 ? chooseBudget(selectedBudgetIndex.value) : null;
                            String? segment;
                            if (totalSelectedFilters.value.where((item) => item.itemType == 'segment').isNotEmpty) {
                              segment =
                                  totalSelectedFilters.value.firstWhere((item) => item.itemType == 'segment').itemName;
                            } else {
                              segment = null;
                            }
                            String? bodyType;
                            if (totalSelectedFilters.value.where((item) => item.itemType == 'bodytype').isNotEmpty) {
                              bodyType =
                                  totalSelectedFilters.value.firstWhere((item) => item.itemType == 'bodytype').itemName;
                            } else {
                              bodyType = null;
                            }

                            int? year = selectedYearIndex.value != -1 ? chooseYear(selectedYearIndex.value) : null;

                            List<int>? owners = [];
                            if (selectedOwnerOptions.value.isNotEmpty) {
                              for (var element in selectedOwnerOptions.value) {
                                int owner = chooseOwners(element);
                                owners.add(owner);
                              }
                            } else {
                              owners = null;
                            }
                            BlocProvider.of<BuyScreenBloc>(context).add(FilterVehicle(
                              brands: brands,
                              fuels: fuels,
                              owner: owners,
                              budget: budget,
                              segment: segment,
                              bodyType: bodyType,
                              yearSpan: year,
                            ));

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) => const SearchResultSeeAllScreen(
                                      focusOn: false,
                                    )),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.isError
                        ? Center(child: Text(state.errorMsg))
                        : AvailableVehiclesGridviewBuyscreen(state: state),

                const SizedBox(height: 80)
              ],
            ),
          );
        },
      ),
    );
  }
}

chooseBudget(int choice) {
  switch (choice) {
    case 0:
    case 10:
      return const Budget(start: 0, end: 10);

    case 1:
    case 25:
      return const Budget(start: 10, end: 25);

    case 2:
    case 50:
      return const Budget(start: 25, end: 50);

    case 3:
    case 75:
      return const Budget(start: 50, end: 75);

    case 4:
    case 100:
      return const Budget(start: 75, end: 100);

    case 5:
    case 500:
      return const Budget(start: 100, end: 500);

    default:
      const Budget(start: 0, end: 500);
  }
}

chooseYear(int choice) {
  switch (choice) {
    case 0:
      return 3;

    case 1:
      return 5;

    case 2:
      return 7;
    case 3:
      return 9;
    case 4:
      return 50;

    default:
      return 50;
  }
}

chooseOwners(String choice) {
  switch (choice) {
    case 'First':
      return 1;

    case 'Second':
      return 2;

    case 'Third':
      return 3;
    case 'Fourth':
      return 4;
    case 'More than Four':
      return 20;

    default:
      return 20;
  }
}

List<Widget> correspondingWidgetsList = const [
  AllBrandsCheckBoxList(),
  TotalBudgetSelectionView(),
  SegmentsFilterOptionsViewWidget(),
  BodyTypeFilterOptionsViewWidget(),
  FilterFuelTypeOptionsView(),
  YearFilterOptionsViewWidget(),
  FilterOwnerOptionsView(),
];
ValueNotifier<List<FilterItem>> totalSelectedFilters = ValueNotifier([]);

class FilterItem {
  final String itemName;
  final void Function() onRemoved;
  final String itemType;

  const FilterItem({required this.itemName, required this.onRemoved, required this.itemType});
}

class Budget extends Equatable {
  final int start;
  final int end;

  const Budget({
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [start, end];

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(start: json['start'], end: json['end']);
  }

  Map<String, dynamic> toJson() => {
        'start': start,
        'end': end,
      };
}

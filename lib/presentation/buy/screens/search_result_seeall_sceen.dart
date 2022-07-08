import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/domain/buy_screen/models/vehicle_model.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';
import 'package:roadway/presentation/buy/screens/vehicle_details_screen.dart';
import 'package:roadway/presentation/buy/widgets/buyscreen_filter_button_widget.dart';
import 'package:roadway/presentation/buy/widgets/details_container_on_search_result.dart';
import 'package:roadway/presentation/buy/widgets/filter_brands_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_budget_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_fueltype_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_number_owner_view.dart';
import 'package:roadway/presentation/buy/widgets/filter_year_view.dart';
import 'package:roadway/presentation/widgets/custom_searchfield_widget.dart';

class SearchResultSeeAllScreen extends StatelessWidget {
  final bool focusOn;
  const SearchResultSeeAllScreen({
    Key? key,
    required this.focusOn
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kBlack,
              ),
            ),
            title: const Text(
              'Roadway',
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: BuyScreenFilterButtonWidget(
                  onApplied: () {
                    var brands = selectedBrands.value.isNotEmpty ? selectedBrands.value : null;
                    var fuels = selectedFuelTypeOptions.value.isNotEmpty ? selectedFuelTypeOptions.value : null;
                    Budget? budget = selectedBudgetIndex.value != -1 ? chooseBudget(selectedBudgetIndex.value) : null;
                    String? segment;
                    if (totalSelectedFilters.value.where((item) => item.itemType == 'segment').isNotEmpty) {
                      segment = totalSelectedFilters.value.firstWhere((item) => item.itemType == 'segment').itemName;
                    } else {
                      segment = null;
                    }
                    String? bodyType;
                    if (totalSelectedFilters.value.where((item) => item.itemType == 'bodytype').isNotEmpty) {
                      bodyType = totalSelectedFilters.value.firstWhere((item) => item.itemType == 'bodytype').itemName;
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
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              CustomSearchFieldWidget(focusOn: focusOn,),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 20),
                    state.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: kBlack,
                          ))
                        : state.isError
                            ? Center(child: Text(state.errorMsg))
                            : state.showFilterList
                                ? state.filterList.isNotEmpty
                                    ? SearchAndFilterResultListView(
                                        resultList: state.filterList,
                                        isFilter: true,
                                      )
                                    : const Center(
                                        child: Text('No vehilces availabe :)'),
                                      )
                                : SearchAndFilterResultListView(
                                    resultList: state.vehiclesList,
                                    isFilter: false,
                                  )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SearchAndFilterResultListView extends StatelessWidget {
  const SearchAndFilterResultListView({
    Key? key,
    required this.resultList,
    required this.isFilter,
  }) : super(key: key);

  final List<Vehicle> resultList;
  final bool isFilter;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: resultList.length,
      itemBuilder: ((context, index) {
        final vehicle = resultList[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (isFilter) {
                  filterOnTap(context, index);
                } else {
                  onTap(context, index);
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: MediaQuery.of(context).size.width - 30,
                height: MediaQuery.of(context).size.width * .6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(vehicle.images[0]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBlack.withOpacity(.3),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vehicle.brand,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: kWhite,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        vehicle.model,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: kWhite,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 106,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: kWhite.withOpacity(.7),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      '₹ ${vehicle.price >= 100 ? (vehicle.price / 100).round() : removeDecimalZero(vehicle.price)} ${vehicle.price >= 100 ? 'Cr' : 'Lac'}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: kBlack,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TransparentDetailsContainerWidget(
                                  detailValue: vehicle.registrationYear,
                                  detailIconIndex: 0,
                                ),
                                TransparentDetailsContainerWidget(
                                  detailValue: vehicle.color,
                                  detailIconIndex: 3,
                                ),
                                TransparentDetailsContainerWidget(
                                  detailValue: vehicle.kilometers,
                                  detailIconIndex: 6,
                                ),
                                TransparentDetailsContainerWidget(
                                  detailValue: vehicle.ownerCount,
                                  detailIconIndex: 4,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

String removeDecimalZero(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
}

void filterOnTap(context, index) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => VehicleDetailsShowScreen(
            isFilterOn: true,
            index: index,
          )),
    ),
  );
}

void onTap(context, index) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => VehicleDetailsShowScreen(
            isFilterOn: false,
            index: index,
          )),
    ),
  );
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/application/favourites/favourites_bloc.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/domain/buy_screen/models/vehicle_model.dart';
import 'package:roadway/presentation/buy/screens/search_result_seeall_sceen.dart';

class FavouritesVehiclesScreen extends StatelessWidget {
  const FavouritesVehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<FavouritesBloc>(context).add(const GetAllFavourites());
      BlocProvider.of<BuyScreenBloc>(context).add(const GetAllVehicles());
      
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: BlocBuilder<BuyScreenBloc, BuyScreenState>(
        builder: (context, vehicleState) {
          return Container(
            child: BlocBuilder<FavouritesBloc, FavouritesState>(
              builder: (context, favState) {
                log('from get totol ${vehicleState.vehiclesList.toString()}');
                List<Vehicle> favVehicles =
                    vehicleState.vehiclesList.where((element) => favState.favouritesIds.contains(element.id)).toList();
                return Container(
                  child: favState.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: kBlack,
                        ))
                      : favState.isError
                          ? Center(
                              child: Text(favState.errorMsg),
                            )
                          : favVehicles.isNotEmpty
                              ? SearchAndFilterResultListView(
                                  resultList: favVehicles,
                                  isFilter: false,
                                )
                              : const Center(
                                  child: Text('Your favourites is empty'),
                                ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

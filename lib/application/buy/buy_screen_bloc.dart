import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:roadway/domain/buy_screen/buy_screen_services.dart';
import 'package:roadway/domain/buy_screen/models/body_types_model.dart';
import 'package:roadway/domain/buy_screen/models/brand_medel.dart';
import 'package:roadway/domain/buy_screen/models/segment_model.dart';
import 'package:roadway/domain/buy_screen/models/vehicle_model.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

part 'buy_screen_event.dart';
part 'buy_screen_state.dart';
part 'buy_screen_bloc.freezed.dart';

@injectable
class BuyScreenBloc extends Bloc<BuyScreenEvent, BuyScreenState> {
  final BuyScreenServices _buyScreenServices;
  BuyScreenBloc(this._buyScreenServices) : super(BuyScreenState.initial()) {
    on<GetAllVehicles>((event, emit) async {
      emit(
        state.copyWith(
          isError: false,
          isLoading: true,
        ),
      );
      Either<String, List<Vehicle>> response = await _buyScreenServices.getAllVehicle();

      response.fold(
        (error) => emit(
          state.copyWith(
            isError: true,
            errorMsg: error,
            isLoading: false,
          ),
        ),
        (result) => emit(
          state.copyWith(
            vehiclesList: result,
            isLoading: false,
            isError: false,
            showFilterList: false,
          ),
        ),
      );
    });

    on<GetAllBrands>((event, emit) async {
      emit(
        state.copyWith(
          isError: false,
          isLoading: true,
        ),
      );
      Either<String, List<Brand>> response = await _buyScreenServices.getAllBrands();

      response.fold(
        (error) => emit(
          state.copyWith(
            isError: true,
            errorMsg: error,
            isLoading: false,
          ),
        ),
        (result) => emit(
          state.copyWith(
            brandsList: result,
            isLoading: false,
            isError: false,
          ),
        ),
      );
    });

    on<GetAllBodyTypes>((event, emit) async {
      emit(
        state.copyWith(
          isError: false,
          isLoading: true,
        ),
      );
      Either<String, List<BodyType>> response = await _buyScreenServices.getBodyTypes();

      response.fold(
        (error) => emit(
          state.copyWith(
            isError: true,
            errorMsg: error,
            isLoading: false,
          ),
        ),
        (result) => emit(
          state.copyWith(
            bodyTypesList: result,
            isLoading: false,
            isError: false,
          ),
        ),
      );
    });

    on<GetAllSegments>((event, emit) async {
      emit(
        state.copyWith(
          isError: false,
          isLoading: true,
        ),
      );
      Either<String, List<Segment>> response = await _buyScreenServices.getSegments();

      response.fold(
        (error) => emit(
          state.copyWith(
            isError: true,
            errorMsg: error,
            isLoading: false,
          ),
        ),
        (result) => emit(
          state.copyWith(
            segmentsList: result,
            isLoading: false,
            isError: false,
          ),
        ),
      );
    });

    on<SearchVehicle>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          isError: false,
        ),
      );
      var filterList = state.vehiclesList
          .where(
            (vehicle) => (vehicle.brand.contains(
                  event.searchKey.toUpperCase(),
                ) ||
                vehicle.model.contains(
                  event.searchKey.toUpperCase(),
                )),
          )
          .toList();

      emit(state.copyWith(
        filterList: filterList,
        showFilterList: true,
        isLoading: false,
      ));

      log(filterList.toString());
    });

    on<FilterVehicle>(
      (event, emit) {
        emit(state.copyWith(
          isLoading: true,
          isError: false,
        ));
        List<Vehicle> filteredList = state.vehiclesList;

        if (event.brands != null && event.brands!.isNotEmpty) {
          filteredList = filteredList.where((element) => event.brands!.contains(element.brand)).toList();
        }
        if (event.fuels != null && event.fuels!.isNotEmpty) {
          filteredList = filteredList.where((element) => event.fuels!.contains(element.fuelType)).toList();
        }
        if (event.owner != null && event.owner!.isNotEmpty && !event.owner!.contains(20)) {
          filteredList =
              filteredList.where((element) => event.owner!.contains(int.tryParse(element.ownerCount))).toList();
        }
        if (event.budget != null) {
          filteredList = filteredList
              .where((element) => event.budget!.start <= element.price && element.price <= event.budget!.end)
              .toList();
        }
        if (event.segment != null) {
          filteredList = filteredList.where((element) => element.segment == event.segment).toList();
        }
        if (event.bodyType != null) {
          filteredList = filteredList.where((element) => element.bodyType == event.bodyType).toList();
        }
        if (event.yearSpan != null) {
          filteredList = filteredList
              .where((element) =>
                  (DateTime.now().year - (int.tryParse(element.registrationYear) ?? 2000)) <= event.yearSpan!)
              .toList();
        }
        emit(state.copyWith(isLoading: false, showFilterList: true, filterList: filteredList));
      },
    );
  }
}

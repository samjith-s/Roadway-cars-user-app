part of 'buy_screen_bloc.dart';

@freezed
class BuyScreenState with _$BuyScreenState {
  const factory BuyScreenState({
    required List<Segment> segmentsList,
    required List<BodyType> bodyTypesList,
    required List<Brand> brandsList,
    required List<Vehicle> vehiclesList,
    required List<Vehicle> filterList,
    required bool isError,
    required String errorMsg,
    required bool isLoading,
    required bool showFilterList,
  }) = _BuyScreenState;

  factory BuyScreenState.initial() => const BuyScreenState(
        segmentsList: [],
        bodyTypesList: [],
        brandsList: [],
        vehiclesList: [],
        filterList: [],
        isError: false,
        errorMsg: '',
        isLoading: false,
        showFilterList: false,
      );
}

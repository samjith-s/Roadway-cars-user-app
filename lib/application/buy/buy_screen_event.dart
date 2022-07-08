part of 'buy_screen_bloc.dart';

@freezed
class BuyScreenEvent with _$BuyScreenEvent {
  const factory BuyScreenEvent.getAllVehicles() = GetAllVehicles;
  const factory BuyScreenEvent.getAllBrands() = GetAllBrands;
  const factory BuyScreenEvent.getAllSegments() = GetAllSegments;
  const factory BuyScreenEvent.getAllBodyTypes() = GetAllBodyTypes;
  const factory BuyScreenEvent.searchVehicle({required String searchKey}) = SearchVehicle;
  const factory BuyScreenEvent.filterVehicle({
    List<String>? brands,
    List<String>? fuels,
    List<int>? owner,
    Budget? budget,
    String? segment,
    String? bodyType,
    int? yearSpan,
  }) = FilterVehicle;
}

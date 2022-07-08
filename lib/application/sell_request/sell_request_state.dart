part of 'sell_request_cubit.dart';

@freezed
class SellRequestState with _$SellRequestState {
  const factory SellRequestState({required int selectedDate}) =
      _SellRequestState;

  factory SellRequestState.initial() =>
      SellRequestState(selectedDate: DateTime.now().year);
}

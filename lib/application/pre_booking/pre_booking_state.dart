part of 'pre_booking_cubit.dart';

@freezed
class PreBookingState with _$PreBookingState {
  const factory PreBookingState({
    required List<PreBooking> totalBookings,
    required bool isLoading,
    required bool isError,
    required String errorText,
  }) = _PreBookingState;

  factory PreBookingState.inital() => const PreBookingState(
        totalBookings: [],
        isLoading: false,
        isError: false,
        errorText: '',
      );
}

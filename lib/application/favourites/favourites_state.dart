part of 'favourites_bloc.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState({
    required bool isLoading,
    required bool isError,
    required String errorMsg,
    required List<String> favouritesIds,
  }) = _FavouritesState;
  factory FavouritesState.initial() => const FavouritesState(
        isLoading: false,
        isError: false,
        errorMsg: '',
        favouritesIds: [],
      );
}

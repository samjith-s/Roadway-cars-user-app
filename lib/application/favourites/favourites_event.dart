part of 'favourites_bloc.dart';

@freezed
class FavouritesEvent with _$FavouritesEvent {
  const factory FavouritesEvent.getAllFavourites() = GetAllFavourites;
  const factory FavouritesEvent.addOrRemoveFromFavourites({
    required String vehicleId,
  }) = AddOrRemoveFromFavourites;
}

part of 'favourite_bloc.dart';

@freezed
class FavouriteEvent with _$FavouriteEvent {
  const factory FavouriteEvent.getFavourites() = GetFavourites;
  const factory FavouriteEvent.reload() = Reload;
}
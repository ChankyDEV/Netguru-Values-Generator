part of 'favourite_bloc.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial({
    required List<Sentence> favourites,
    required bool hasError,
    required bool isLoading,
    required String errorMessage,
  }) = Initial;
}

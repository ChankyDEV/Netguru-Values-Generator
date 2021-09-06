import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service.dart';

part 'favourite_bloc.freezed.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final SentenceService _sentenceService;

  FavouriteBloc(
    this._sentenceService,
  ) : super(
          FavouriteState.initial(
            favourites: <Sentence>[],
            hasError: false,
            isLoading: true,
          ),
        );

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    yield* event.map(getFavourites: _getFavourites);
  }

  Stream<FavouriteState> _getFavourites(GetFavourites value) async* {
    final failureOrFavourites = await _sentenceService.getFavouriteSentences();
    yield failureOrFavourites.fold<FavouriteState>(
      (l) => _showError(l),
      (r) => _showFavourites(r),
    );
  }

  void getFavouriteSentences() {
    this.add(
      FavouriteEvent.getFavourites(),
    );
  }

  FavouriteState _showError(Failure l) {
    return state.copyWith(
      isLoading: false,
      hasError: true,
    );
  }

  FavouriteState _showFavourites(List<Sentence> favouriteSentences) {
    return state.copyWith(
      favourites: favouriteSentences,
      isLoading: false,
    );
  }
}

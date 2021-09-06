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
            errorMessage: '',
            isRetryButtonClicked: false,
          ),
        );

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    yield* event.map(
      getFavourites: _getFavourites,
      reload: _reload,
    );
  }

  Stream<FavouriteState> _getFavourites(GetFavourites value) async* {
    yield* _favourites();
  }

  void getFavouriteSentences() {
    this.add(
      FavouriteEvent.getFavourites(),
    );
  }

  FavouriteState _showError(Failure f) {
    return state.copyWith(
      isLoading: false,
      hasError: true,
      errorMessage: f.message,
    );
  }

  FavouriteState _showFavourites(List<Sentence> favouriteSentences) {
    return state.copyWith(
      favourites: favouriteSentences,
      isLoading: false,
      hasError: false,
    );
  }

  Stream<FavouriteState> _reload(Reload value) async* {
    yield _tapOrReleaseRetryButton();
    await Future.delayed(const Duration(seconds: 2));
    yield* _favourites();
    yield _tapOrReleaseRetryButton();
  }

  FavouriteState _tapOrReleaseRetryButton() {
    return state.copyWith(
      isRetryButtonClicked: !state.isRetryButtonClicked,
    );
  }

  Stream<FavouriteState> _favourites() async* {
    final failureOrSentences = await _sentenceService.getFavouriteSentences();
    yield failureOrSentences.fold<FavouriteState>(
      (l) => _showError(l),
      (r) => _showFavourites(r),
    );
  }
}

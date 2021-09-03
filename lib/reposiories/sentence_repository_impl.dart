import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/reposiories/sentence_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SentenceRepositoryImpl implements SentenceRepository {
  final SharedPreferences _prefs;

  SentenceRepositoryImpl(this._prefs);

  @override
  Future<List<SentenceDTO>> getAllSentences() {
    return Future.value([]);
  }

  @override
  Future<SentenceDTO> saveSentence(SentenceDTO sentence) async {
    return Future.value(
      SentenceDTO('', true),
    );
  }
}

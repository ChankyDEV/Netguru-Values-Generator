import 'package:dartz/dartz.dart';
import 'package:netguru_values_generator/converters/sentence/sentence_to_dto_converter.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service.dart';
import 'package:netguru_values_generator/utils/consts.dart';

class SentenceServiceImpl implements SentenceService {
  final SentenceRepository _repository;
  final SentenceToDtoConverter _converter;

  SentenceServiceImpl(
    this._repository,
    this._converter,
  );

  @override
  Future<Either<Failure, List<Sentence>>> getAllSentences() async {
    try {
      final sentences = await _repository.getAllSentences();
      return right(sentences);
    } on SentenceException {
      return left(
        Failure(
          ErrorMessages.sentences.cantGetSentences,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Sentence>> saveSentence(
      Sentence sentenceToSave) async {
    try {
      final sentence = await _repository.saveSentence(
        _converter.convert(sentenceToSave),
      );
      return right(sentence);
    } on SentenceException {
      return left(
        Failure(
          ErrorMessages.sentences.cantSaveSentence,
        ),
      );
    }
  }
}

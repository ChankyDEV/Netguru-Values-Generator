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
        const Failure(
          SentenceErrorMessages.cantGetSentences,
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
        const Failure(
          SentenceErrorMessages.cantSaveSentence,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> replaceAll(List<Sentence> sentences) async {
    try {
      await _repository.replaceAll(
        _converter.convertAll(sentences),
      );
      return right(unit);
    } on SentenceException {
      return left(
        const Failure(
          SentenceErrorMessages.cantReplaceAllSentences,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Sentence>>> getFavouriteSentences() async {
    try {
      final favourites = await _repository.getFavouriteSentences();
      return right(favourites);
    } on SentenceException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }
}

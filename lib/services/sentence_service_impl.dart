import 'package:dartz/dartz.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/reposiories/sentence_repository.dart';
import 'package:netguru_values_generator/services/sentence_service.dart';
import 'package:netguru_values_generator/utils/consts.dart';

class SentenceServiceImpl implements SentenceService {
  final SentenceRepository _repository;

  SentenceServiceImpl(this._repository);

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
        SentenceDTO.fromDomain(sentenceToSave),
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

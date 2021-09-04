import 'package:dartz/dartz.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';

abstract class SentenceService {
  Future<Either<Failure, List<Sentence>>> getAllSentences();

  Future<Either<Failure, List<Sentence>>> getFavouriteSentences();

  Future<Either<Failure, Unit>> replaceAll(List<Sentence> sentences);

  Future<Either<Failure, Sentence>> saveSentence(Sentence sentence);
}

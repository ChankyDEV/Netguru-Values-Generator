import 'package:dartz/dartz.dart';
import 'package:netguru_values_generator/models/failure.dart';

abstract class UserPresenceService {
  Future<Either<Failure, Unit>> configureApp();
}

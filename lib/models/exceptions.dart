import 'package:equatable/equatable.dart';

class SentenceException extends Equatable implements Exception {
  final String message;

  const SentenceException({this.message = ''});

  @override
  List<Object?> get props => [message];
}

class UserPresenceException extends Equatable implements Exception {
  final String message;

  UserPresenceException({this.message = ''});

  @override
  List<Object?> get props => [message];
}

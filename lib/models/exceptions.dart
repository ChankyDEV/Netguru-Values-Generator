import 'package:equatable/equatable.dart';

class SentenceException extends Equatable implements Exception {
  final String message;

  SentenceException({this.message = ''});

  @override
  List<Object?> get props => [message];
}

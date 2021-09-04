import 'package:equatable/equatable.dart';

class Sentence extends Equatable {
  late final String _uid;
  final String _value;
  final bool _isFavourite;

  Sentence(
    this._value,
    this._isFavourite,
  );

  Sentence.withUid(
    this._uid,
    this._value,
    this._isFavourite,
  );

  String get uid => this._uid;

  String get value => this._value;

  bool get isFavourite => this._isFavourite;

  @override
  List<Object?> get props => [
        this._uid,
        this._value,
        this._isFavourite,
      ];
}

import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class Sentence extends Equatable {
  String _uid;
  String _value;
  bool _isFavourite;

  Sentence(
    this._uid,
    this._value,
    this._isFavourite,
  );

  String get uid => this._uid;

  String get value => this._value;

  bool get isFavourite => this._isFavourite;

  void changeFavouriteStatus() {
    _isFavourite = !_isFavourite;
  }

  @override
  List<Object?> get props => [
        this._uid,
        this._value,
        this._isFavourite,
      ];

  @override
  bool? get stringify => true;
}

import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class Sentence extends Equatable {
  final String uid;
  final String value;
  bool _isFavourite;

  Sentence(
    this.uid,
    this.value,
    this._isFavourite,
  );

  bool get isFavourite => this._isFavourite;

  void changeFavouriteStatus() {
    _isFavourite = !_isFavourite;
  }

  @override
  List<Object?> get props => [
        this.uid,
        this.value,
        this._isFavourite,
      ];

  @override
  bool? get stringify => true;
}

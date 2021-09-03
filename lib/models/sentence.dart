import 'package:equatable/equatable.dart';

class Sentence extends Equatable {
  final String value;
  final bool isFavourite;

  const Sentence(
    this.value, {
    this.isFavourite = false,
  });

  @override
  List<Object?> get props => [
        this.value,
        this.isFavourite,
      ];
}

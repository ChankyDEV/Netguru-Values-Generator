import 'package:equatable/equatable.dart';

class SentenceDTO extends Equatable {
  final String uid;
  final String value;
  final bool isFavourite;

  SentenceDTO(
    this.uid,
    this.value,
    this.isFavourite,
  );

  factory SentenceDTO.fromJson(Map<String, dynamic> jsonMap) {
    return SentenceDTO(
      jsonMap['uid'],
      jsonMap['value'],
      jsonMap['isFavourite'],
    );
  }

  SentenceDTO copyWith({
    String? value,
    bool? isFavourite,
  }) =>
      SentenceDTO(
        this.uid,
        value ?? this.value,
        isFavourite ?? this.isFavourite,
      );

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'value': value,
      'isFavourite': isFavourite,
    };
  }

  @override
  List<Object?> get props => [
        this.uid,
        this.value,
        this.isFavourite,
      ];
}

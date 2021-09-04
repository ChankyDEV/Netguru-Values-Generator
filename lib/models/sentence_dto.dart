import 'package:netguru_values_generator/models/sentence.dart';

class SentenceDTO extends Sentence {
  final String uid;
  final String value;
  final bool isFavourite;

  SentenceDTO(
    this.uid,
    this.value,
    this.isFavourite,
  ) : super.withUid(
          uid,
          value,
          isFavourite,
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
}

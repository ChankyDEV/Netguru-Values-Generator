import 'package:netguru_values_generator/models/sentence.dart';

class SentenceDTO extends Sentence {
  final String value;
  final bool isFavourite;

  SentenceDTO(
    this.value,
    this.isFavourite,
  ) : super(
          value,
          isFavourite: isFavourite,
        );

  factory SentenceDTO.fromJson(Map<String, dynamic> jsonMap) {
    return SentenceDTO(
      jsonMap['value'],
      jsonMap['isFavourite'],
    );
  }

  SentenceDTO copyWith({
    String? value,
    bool? isFavourite,
  }) =>
      SentenceDTO(
        value ?? this.value,
        isFavourite ?? this.isFavourite,
      );

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'isFavourite': isFavourite,
    };
  }

  factory SentenceDTO.fromDomain(Sentence sentence) {
    return SentenceDTO(
      sentence.value,
      sentence.isFavourite,
    );
  }
}

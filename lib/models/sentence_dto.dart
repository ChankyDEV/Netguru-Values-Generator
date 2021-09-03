import 'package:netguru_values_generator/models/sentence.dart';

class SentenceDTO extends Sentence {
  const SentenceDTO(
    String value,
    bool isFavourite,
  ) : super(value, isFavourite);

  factory SentenceDTO.fromJson(Map<String, dynamic> jsonMap) {
    return SentenceDTO(
      jsonMap['value'],
      jsonMap['isFavourite'],
    );
  }

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

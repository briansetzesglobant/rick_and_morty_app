import '../../domain/entity/character_response_entity.dart';
import 'info.dart';
import 'character.dart';

class CharacterResponse extends CharacterResponseEntity {
  CharacterResponse({
    required this.info,
    required this.results,
  }) : super(
          info: info,
          results: results,
        );

  factory CharacterResponse.fromJson(Map<String, dynamic> parsedJson) {
    var parsedJsonList = parsedJson['results'] as List;
    List<Character> resultsList = parsedJsonList
        .map((eachResults) => Character.fromJson(eachResults))
        .toList();

    return CharacterResponse(
      info: Info.fromJson(parsedJson['info']),
      results: resultsList,
    );
  }

  final Info info;
  final List<Character> results;
}

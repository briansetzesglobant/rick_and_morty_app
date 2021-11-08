import '../../domain/entity/general_character_entity.dart';
import 'info.dart';
import 'character.dart';

class GeneralCharacter extends GeneralCharacterEntity {
  GeneralCharacter({
    required this.info,
    required this.results,
  }) : super(
          info: info,
          results: results,
        );

  factory GeneralCharacter.fromJson(Map<String, dynamic> parsedJson) {
    var parsedJsonList = parsedJson['results'] as List;
    List<Character> resultsList = parsedJsonList
        .map((eachResults) => Character.fromJson(eachResults))
        .toList();

    return GeneralCharacter(
      info: Info.fromJson(parsedJson['info']),
      results: resultsList,
    );
  }

  final Info? info;
  final List<Character> results;
}

import '../../domain/entity/character_entity.dart';
import 'info.dart';
import 'result.dart';

class Character extends CharacterEntity {
  const Character({
    required this.info,
    required this.results,
  }) : super(
          info: info,
          results: results,
        );

  factory Character.fromJson(Map<String, dynamic> parsedJson) {
    var parsedJsonList = parsedJson['results'] as List;
    List<Result> resultsList = parsedJsonList
        .map((eachResults) => Result.fromJson(eachResults))
        .toList();

    return Character(
      info: Info.fromJson(parsedJson['info']),
      results: resultsList,
    );
  }

  final Info info;
  final List<Result> results;
}

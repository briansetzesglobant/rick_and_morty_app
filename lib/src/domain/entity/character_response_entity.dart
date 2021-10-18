import 'info_entity.dart';
import 'character_entity.dart';

class CharacterResponseEntity {
  CharacterResponseEntity({
    required this.info,
    required this.results,
  });

  final InfoEntity info;
  final List<CharacterEntity> results;
}

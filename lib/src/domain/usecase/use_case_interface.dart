import '../../data/model/character_response.dart';

abstract class UseCaseInterface {
  Future<CharacterResponse> fetchAllCharacters();
}

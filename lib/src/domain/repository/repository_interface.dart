import '../../data/model/character_response.dart';

abstract class RepositoryInterface {
  Future<CharacterResponse> fetchAllCharacters();
}

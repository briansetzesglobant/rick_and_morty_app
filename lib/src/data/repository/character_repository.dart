import '../model/general_character.dart';
import '../../domain/repository/repository_interface.dart';
import '../datasource/remote/character_api_service.dart';

class CharacterRepository extends RepositoryInterface {
  CharacterRepository();

  final CharacterApiService characterApiService = CharacterApiService();

  @override
  Future<GeneralCharacter?> fetchAllCharacters() {
    return characterApiService.fetchAllCharacters();
  }

  @override
  Future<GeneralCharacter?> fetchCharactersNextPage(String next) {
    return characterApiService.fetchCharactersNextPage(next);
  }
}

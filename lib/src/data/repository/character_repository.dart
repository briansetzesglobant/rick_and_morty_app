import '../model/character_response.dart';
import '../../domain/repository/repository_interface.dart';
import '../datasource/remote/character_api_service.dart';

class CharacterRepository extends RepositoryInterface {
  CharacterRepository();

  final CharacterApiService characterApiService = CharacterApiService();

  @override
  Future<CharacterResponse> fetchAllCharacters() {
    return characterApiService.fetchAllCharacters();
  }
}

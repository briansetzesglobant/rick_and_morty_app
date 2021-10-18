import '../model/characteres.dart';
import '../../domain/repository/repository_interface.dart';
import '../datasource/remote/characters_api_service.dart';

class CharactersRepository extends RepositoryInterface {
  CharactersRepository();

  final CharactersApiService charactersApiService = CharactersApiService();

  @override
  Future<Characteres> fetchAllCharacters() {
    return charactersApiService.fetchAllCharacters();
  }
}

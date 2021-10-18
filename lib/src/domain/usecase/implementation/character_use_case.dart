import '../../../data/model/character_response.dart';
import '../../../data/repository/character_repository.dart';
import '../use_case_interface.dart';

class CharacterUseCase implements UseCaseInterface {
  CharacterUseCase();

  final CharacterRepository _characterRepository = CharacterRepository();

  @override
  Future<CharacterResponse> fetchAllCharacters() {
    return _characterRepository.fetchAllCharacters();
  }
}

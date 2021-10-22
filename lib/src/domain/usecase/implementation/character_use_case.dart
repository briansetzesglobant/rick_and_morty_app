import '../../../data/model/general_character.dart';
import '../../../data/repository/character_repository.dart';
import '../use_case_interface.dart';

class CharacterUseCase implements UseCaseInterface {
  CharacterUseCase();

  final CharacterRepository _characterRepository = CharacterRepository();

  @override
  Future<GeneralCharacter> fetchAllCharacters(int pageNumber) {
    return _characterRepository.fetchAllCharacters(pageNumber);
  }
}

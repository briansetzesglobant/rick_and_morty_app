import '../../../data/datasource/local/DAOs/character_database.dart';
import '../../../data/model/general_character.dart';
import '../../../data/repository/character_repository.dart';
import '../use_case_interface.dart';

class CharacterUseCase implements UseCaseInterface {
  CharacterUseCase();

  final CharacterRepository _characterRepository = CharacterRepository();
  CharacterDatabase _characterDatabase = CharacterDatabase();

  @override
  Future<GeneralCharacter?> fetchAllCharacters() async {
    GeneralCharacter? _generalCharacter =
        await _characterRepository.fetchAllCharacters();
    if (_generalCharacter?.results.isNotEmpty == true) {
      await _characterDatabase.dropDatabase();
      await _characterDatabase
          .addCharacterToDataBase(_generalCharacter!.results);
    }
    return GeneralCharacter(
      info: _generalCharacter?.info,
      results: await _characterDatabase.fetchCharacterFromDataBase(),
    );
  }

  @override
  Future<GeneralCharacter?> fetchCharactersNextPage(String next) {
    return _characterRepository.fetchCharactersNextPage(next);
  }
}

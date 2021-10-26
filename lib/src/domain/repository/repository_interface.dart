import '../../data/model/general_character.dart';

abstract class RepositoryInterface {
  Future<GeneralCharacter> fetchAllCharacters();

  Future<GeneralCharacter> fetchCharactersNextPage(String next);
}

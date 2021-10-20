import '../../data/model/general_character.dart';

abstract class UseCaseInterface {
  Future<GeneralCharacter> fetchAllCharacters();
}

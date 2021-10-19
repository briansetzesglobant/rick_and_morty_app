import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/src/data/datasource/remote/character_api_service.dart';
import 'package:rick_and_morty_app/src/data/model/general_character.dart';

void main() {
  late CharacterApiService characterApiService;

  setUp(() {
    characterApiService = CharacterApiService();
  });

  test('It should be generated a response with the characters', () async {
    GeneralCharacter characterResponse =
        await characterApiService.fetchAllCharacters();
    expect(
      characterResponse.results,
      isNotEmpty,
    );
  });
}

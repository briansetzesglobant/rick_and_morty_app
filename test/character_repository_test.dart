import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/src/data/model/character_response.dart';
import 'package:rick_and_morty_app/src/data/repository/character_repository.dart';

void main() {
  late CharacterRepository characterRepository;

  setUp(() {
    characterRepository = CharacterRepository();
  });

  test('It should be generated a response with the characters', () async {
    CharacterResponse characterResponse =
        await characterRepository.fetchAllCharacters();
    expect(
      characterResponse.results,
      isNotEmpty,
    );
  });
}

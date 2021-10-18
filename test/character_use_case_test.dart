import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/src/data/model/character_response.dart';
import 'package:rick_and_morty_app/src/domain/usecase/implementation/character_use_case.dart';

void main() {
  late CharacterUseCase characterUseCase;

  setUp(() {
    characterUseCase = CharacterUseCase();
  });

  test('It should be generated a response with the characters', () async {
    CharacterResponse characterResponse =
        await characterUseCase.fetchAllCharacters();
    expect(
      characterResponse.results,
      isNotEmpty,
    );
  });
}

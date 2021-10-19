import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/src/data/model/general_character.dart';
import 'package:rick_and_morty_app/src/presentation/bloc/character_bloc.dart';

void main() {
  late CharacterBloc characterBloc;

  setUp(() {
    characterBloc = CharacterBloc();
  });

  group('Response of the characters', () {
    test('It should be generated a response with the characters', () async {
      characterBloc.fetchAllCharacters();
      expect(characterBloc.characterStream, emits(isA<GeneralCharacter>()));
    });

    test('It should be generated a response with the characters', () async {
      characterBloc.fetchAllCharacters();
      characterBloc.characterStream.listen(expectAsync1((event) {
        expect(event, isInstanceOf<GeneralCharacter>());
      }));
    });
  });
}

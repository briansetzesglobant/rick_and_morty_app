import 'dart:async';
import '../../data/datasource/local/DAOs/character_database.dart';
import '../../core/bloc/bloc_interface.dart';
import '../../data/model/general_character.dart';
import '../../domain/usecase/implementation/character_use_case.dart';

class CharacterBloc implements BlocInterface {
  CharacterBloc();

  CharacterUseCase _characterUseCase = CharacterUseCase();
  late GeneralCharacter _generalCharacter;
  late String? _nextPageCharacter;
  CharacterDatabase _characterDatabase = CharacterDatabase.singleton;

  StreamController<GeneralCharacter> _characterStreamController =
      StreamController();

  Stream<GeneralCharacter> get characterStream =>
      _characterStreamController.stream;

  @override
  String? get nextPageCharacter => _nextPageCharacter;

  @override
  Future<void> initialize() async {
    this.characterStream.listen((eventCharacters) {
      _generalCharacter = eventCharacters;
    });
  }

  @override
  void dispose() {
    _characterStreamController.close();
  }

  @override
  void fetchFirstCharacters() async {
    final _generalCharacterFirst = await _characterUseCase.fetchAllCharacters();
    _nextPageCharacter = _generalCharacterFirst.info.next!;
    if (_generalCharacterFirst.results.isNotEmpty) {
      await _characterDatabase.dropDatabase();
      await _characterDatabase
          .addCharacterToDataBase(_generalCharacterFirst.results);
    }
    _generalCharacter = GeneralCharacter(
      info: _generalCharacterFirst.info,
      results: await _characterDatabase.fetchCharacterFromDataBase(),
    );
    _characterStreamController.sink.add(_generalCharacter);
  }

  @override
  void fetchCharactersNextPage(String next) async {
    final _generalCharacterNext =
        await _characterUseCase.fetchCharactersNextPage(next);
    _generalCharacter.results.addAll(_generalCharacterNext.results);
    _nextPageCharacter = _generalCharacterNext.info.next!;
    _characterStreamController.sink.add(
      _generalCharacter
    );
  }
}

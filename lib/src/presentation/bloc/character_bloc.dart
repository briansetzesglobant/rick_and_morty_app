import 'dart:async';
import '../../core/bloc/bloc_interface.dart';
import '../../data/model/general_character.dart';
import '../../domain/usecase/implementation/character_use_case.dart';

class CharacterBloc implements BlocInterface {
  CharacterBloc();

  CharacterUseCase _characterUseCase = CharacterUseCase();
  String? _nextPageCharacter;
  GeneralCharacter? _generalCharacter;

  StreamController<GeneralCharacter?> _characterStreamController =
      StreamController.broadcast();

  Stream<GeneralCharacter?> get characterStream =>
      _characterStreamController.stream;

  @override
  String? get nextPageCharacter => _nextPageCharacter;

  @override
  bool hasNextPageCharacter() => _nextPageCharacter != null;

  @override
  Future<void> initialize() async {
    _characterStreamController.stream.listen((eventCharacters) {
      _nextPageCharacter = eventCharacters?.info?.next;
    });
  }

  @override
  void dispose() {
    _characterStreamController.close();
  }

  @override
  void fetchFirstCharacters() async {
    _generalCharacter = await _characterUseCase.fetchAllCharacters();
    _characterStreamController.sink.add(
      _generalCharacter,
    );
  }

  @override
  void fetchCharactersNextPage(String next) async {
    GeneralCharacter? _generalCharacterNext =
        await _characterUseCase.fetchCharactersNextPage(next);
    _generalCharacter?.results.addAll(_generalCharacterNext?.results ?? []);
    _characterStreamController.sink.add(
      GeneralCharacter(
        info: _generalCharacterNext?.info,
        results: _generalCharacter!.results,
      ),
    );
  }
}

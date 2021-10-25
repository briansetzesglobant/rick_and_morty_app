import 'dart:async';
import '../../core/util/numbers_constants.dart';
import '../../core/util/strings_constants.dart';
import '../../data/model/info.dart';
import '../../core/bloc/bloc_interface.dart';
import '../../data/model/general_character.dart';
import '../../domain/usecase/implementation/character_use_case.dart';

class CharacterBloc implements BlocInterface {
  CharacterBloc();

  CharacterUseCase _characterUseCase = CharacterUseCase();
  GeneralCharacter _generalCharacter = GeneralCharacter(
    info: Info(
        count: NumbersConstants.constantInitialization,
        pages: NumbersConstants.constantInitialization,
        next: StringsConstants.constantInitialization,
        prev: StringsConstants.constantInitialization),
    results: [],
  );

  StreamController<GeneralCharacter> _characterStreamController =
      StreamController();

  Stream<GeneralCharacter> get characterStream =>
      _characterStreamController.stream;

  @override
  Future<void> initialize() async {
    this.characterStream.listen((event) {
      _generalCharacter = event;
    });
  }

  @override
  void dispose() {
    _characterStreamController.close();
  }

  @override
  void fetchAllCharacters() async {
    _generalCharacter = await _characterUseCase.fetchAllCharacters();
    _characterStreamController.sink.add(_generalCharacter);
  }

  @override
  void fetchAllNextPage(String? next) async {
    final _generalCharacterNext = await _characterUseCase.fetchNextPage(next);
    for (int i =
            _generalCharacter.results.length - NumbersConstants.numberOneFor;
        i >= NumbersConstants.numberZeroFor;
        i--) {
      _generalCharacterNext.results
          .insert(NumbersConstants.numberZeroFor, _generalCharacter.results[i]);
    }
    _generalCharacter = _generalCharacterNext;
    _characterStreamController.sink.add(_generalCharacter);
  }
}

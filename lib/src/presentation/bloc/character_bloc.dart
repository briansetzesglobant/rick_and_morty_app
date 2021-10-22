import 'dart:async';
import '../../core/bloc/bloc_interface.dart';
import '../../data/model/general_character.dart';
import '../../domain/usecase/implementation/character_use_case.dart';

class CharacterBloc implements BlocInterface {
  CharacterBloc();

  CharacterUseCase _characterUseCase = CharacterUseCase();
  StreamController<GeneralCharacter> _characterStreamController =
      StreamController();

  Stream<GeneralCharacter> get characterStream =>
      _characterStreamController.stream;

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {
    _characterStreamController.close();
  }

  @override
  void fetchAllCharacters(int pageNumber) async {
    final _characterList =
        await _characterUseCase.fetchAllCharacters(pageNumber);
    _characterStreamController.sink.add(_characterList);
  }
}

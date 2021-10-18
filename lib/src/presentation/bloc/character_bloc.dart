import 'dart:async';
import '../../core/bloc/bloc_interface.dart';
import '../../data/model/character_response.dart';
import '../../domain/usecase/implementation/character_use_case.dart';

class CharacterBloc implements BlocInterface {
  CharacterBloc();

  CharacterUseCase _characterUseCase = CharacterUseCase();
  StreamController<CharacterResponse> _characterStreamController =
      StreamController();

  Stream<CharacterResponse> get characterStream =>
      _characterStreamController.stream;

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {
    _characterStreamController.close();
  }

  @override
  void fetchAllCharacters() async {
    final _characterList = await _characterUseCase.fetchAllCharacters();
    _characterStreamController.sink.add(_characterList);
  }
}

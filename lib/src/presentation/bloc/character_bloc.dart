import 'dart:async';

import 'package:rick_and_morty_app/src/data/model/character_response.dart';

import '../../domain/usecase/implementation/character_usecase.dart';

class CharacterBloc extends  BlocInterface{
  CharacterBloc();

  late CharacterUseCase _characterUseCase;
  final _pokemonFetcher = StreamController<CharacterResponse>.broadcast();

  Stream<CharacterResponse> get allStream => _pokemonFetcher.stream;

  @override
  void fetchAllPokemons() async {
    List<Pokemon> pokemonModel = await _pokemonUseCase.call();
    _pokemonFetcher.sink.add(pokemonModel);
  }

  @override
  Future<void> initialize() async {
    _pokemonUseCase = GetPokemonsUseCase();
  }

  @override
  void dispose() {
    _pokemonFetcher.close();
  }
}

import '../../data/model/character_response.dart';
import 'bloc.dart';

abstract class BlocInterface extends Bloc {
  Stream<CharacterResponse> get characterStream;

  void fetchAllCharacters();
}

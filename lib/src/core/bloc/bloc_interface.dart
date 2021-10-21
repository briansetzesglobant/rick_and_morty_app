import '../../data/model/general_character.dart';
import 'bloc.dart';

abstract class BlocInterface extends Bloc {
  Stream<GeneralCharacter> get characterStream;

  void fetchAllCharacters();
}

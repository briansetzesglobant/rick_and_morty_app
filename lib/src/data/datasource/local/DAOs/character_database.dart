import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/util/strings_constants.dart';
import '../../../model/character.dart';

class CharacterDatabase {
  factory CharacterDatabase() => singleton;

  CharacterDatabase._create();

  static CharacterDatabase singleton = CharacterDatabase._create();

  FirebaseFirestore get instanceFirestore => FirebaseFirestore.instance;

  CollectionReference get character =>
      instanceFirestore.collection(StringsConstants.characterCollection);

  Future<void> dropDatabase() async => await character.get().then(
        (value) {
          for (QueryDocumentSnapshot<Object?> doc in value.docs) {
            doc.reference.delete();
          }
        },
      );

  Future<void> addCharacterToDataBase(List<Character> listCharacter) async {
    for (Character element in listCharacter) {
      await character.doc().set(
            Character(
              id: element.id,
              name: element.name,
              status: element.status,
              species: element.species,
              type: element.type,
              gender: element.gender,
              origin: element.origin,
              location: element.location,
              image: element.image,
              episode: element.episode,
              url: element.url,
              created: element.created,
            ).toJson(),
          );
    }
  }

  Future<List<Character>> fetchCharacterFromDataBase() async {
    List<Character> listCharacter = [];
    await character.orderBy(StringsConstants.characterId).get().then(
      (value) {
        for (QueryDocumentSnapshot<Object?> doc in value.docs) {
          listCharacter.add(
            Character.fromJson(
              doc.data() as Map<String, dynamic>,
            ),
          );
        }
      },
    );
    return listCharacter;
  }
}

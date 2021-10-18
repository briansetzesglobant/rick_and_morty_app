import 'location.dart';
import 'origin.dart';
import '../../domain/entity/character_entity.dart';

class Character extends CharacterEntity {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episode: episode,
          url: url,
          created: created,
        );

  factory Character.fromJson(Map<String, dynamic> parsedJson) {
    var parsedJsonList = parsedJson['episode'] as List;
    List<String> episodeList = [];
    for (int i = 0; i < parsedJsonList.length; i++) {
      episodeList.add(parsedJsonList[i]);
    }

    return Character(
      id: parsedJson['id'],
      name: parsedJson['name'],
      status: parsedJson['status'],
      species: parsedJson['species'],
      type: parsedJson['type'],
      gender: parsedJson['gender'],
      origin: Origin.fromJson(parsedJson['origin']),
      location: Location.fromJson(parsedJson['location']),
      image: parsedJson['image'],
      episode: episodeList,
      url: parsedJson['url'],
      created: parsedJson['created'],
    );
  }

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;
}

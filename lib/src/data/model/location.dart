import '../../domain/entity/location_entity.dart';

class Location extends LocationEntity {
  Location({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory Location.fromJson(Map<String, dynamic> parsedJson) {
    return Location(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }

  final String name;
  final String url;
}

import '../../domain/entity/origin_entity.dart';

class Origin extends OriginEntity {
  Origin({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory Origin.fromJson(Map<String, dynamic> parsedJson) {
    return Origin(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }

  final String name;
  final String url;
}

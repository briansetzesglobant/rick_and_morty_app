import '../../domain/entity/info_entity.dart';

class Info extends InfoEntity {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  }) : super(
          count: count,
          pages: pages,
          next: next,
          prev: prev,
        );

  factory Info.fromJson(Map<String, dynamic> parsedJson) {
    return Info(
      count: parsedJson['count'],
      pages: parsedJson['pages'],
      next: parsedJson['next'],
      prev: parsedJson['prev'],
    );
  }

  final int count;
  final int pages;
  final String? next;
  final String? prev;
}

import 'dart:convert';
import 'package:http/http.dart';
import '../../model/general_character.dart';
import '../../../core/util/endpoints_constants.dart';
import '../../../core/util/numbers_constants.dart';

class CharacterApiService {
  CharacterApiService();

  Client client = Client();

  Future<GeneralCharacter?> fetchAllCharacters() async {
    GeneralCharacter? _generalCharacter;
    try {
      final _response = await client.get(
        Uri.parse(
          EndpointsConstants.charactersEndpoint,
        ),
      );
      if (_response.statusCode == NumbersConstants.status) {
        _generalCharacter =
            GeneralCharacter.fromJson(json.decode(_response.body));
      }
    } catch (Exception) {}
    return _generalCharacter;
  }

  Future<GeneralCharacter?> fetchCharactersNextPage(String next) async {
    GeneralCharacter? _generalCharacter;
    try {
      final _response = await client.get(
        Uri.parse(
          next,
        ),
      );
      if (_response.statusCode == NumbersConstants.status) {
        _generalCharacter =
            GeneralCharacter.fromJson(json.decode(_response.body));
      }
    } catch (Exception) {}
    return _generalCharacter;
  }
}

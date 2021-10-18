import 'dart:convert';
import 'package:http/http.dart';
import '../../model/character_response.dart';
import '../../../core/util/endpoints_constants.dart';
import '../../../core/util/numbers_constants.dart';
import '../../../core/util/strings_constants.dart';

class CharacterApiService {
  CharacterApiService();

  Client client = Client();

  Future<CharacterResponse> fetchAllCharacters() async {
    final _response = await client.get(
      Uri.parse(
        EndpointsConstants.charactersEndpoint,
      ),
    );
    return response(_response);
  }

  CharacterResponse response(Response _response) {
    if (_response.statusCode == NumbersConstants.status) {
      return CharacterResponse.fromJson(json.decode(
        _response.body,
      ));
    } else {
      throw Exception(
        StringsConstants.error + _response.statusCode.toString(),
      );
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart';
import '../../model/info.dart';
import '../../model/general_character.dart';
import '../../../core/util/endpoints_constants.dart';
import '../../../core/util/numbers_constants.dart';
import '../../../core/util/strings_constants.dart';

class CharacterApiService {
  CharacterApiService();

  Client client = Client();
  GeneralCharacter generalCharacter = GeneralCharacter(
    info: Info(
        count: NumbersConstants.constantInitialization,
        pages: NumbersConstants.constantInitialization,
        next: StringsConstants.constantInitialization,
        prev: StringsConstants.constantInitialization),
    results: [],
  );

  Future<GeneralCharacter> fetchAllCharacters(int pageNumber) async {
    final _response = await client.get(
      Uri.parse(
        EndpointsConstants.charactersEndpoint + pageNumber.toString(),
      ),
    );
    return response(_response, pageNumber);
  }

  GeneralCharacter response(Response _response, int pageNumber) {
    if (_response.statusCode == NumbersConstants.status) {
      if (pageNumber == NumbersConstants.firstPage) {
        generalCharacter =
            GeneralCharacter.fromJson(json.decode(_response.body));
      } else {
        generalCharacter.results.addAll(
            GeneralCharacter.fromJson(json.decode(_response.body)).results);
      }
      return generalCharacter;
    } else {
      throw Exception(
        StringsConstants.error + _response.statusCode.toString(),
      );
    }
  }
}

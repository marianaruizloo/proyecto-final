import 'package:http/http.dart' as http;
import 'package:my_app/models/pokemon.dart';

abstract class PokemonService {
  static Future<ReqPokemonResponse> getPokemons() async {
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20"),
    );

    if (response.statusCode == 200) {
      print("Get data from http call");
      return reqPokemontResponseFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
  }
}

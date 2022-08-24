import 'dart:convert';

ReqPokemonResponse reqPokemontResponseFromJson(String str) =>
    ReqPokemonResponse.fromJson(json.decode(str));

String pokemonToJson(ReqPokemonResponse results) =>
    json.encode(results.toJson());

class ReqPokemonResponse {
  ReqPokemonResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  String? previous;

  List<Pokemon>? results;

  factory ReqPokemonResponse.fromJson(Map<String, dynamic> json) =>
      ReqPokemonResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Pokemon {
  Pokemon({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

import 'pokemon_type.dart';

class PokemonDetails {
  int id;
  String name;
  int height;
  int weight;
  List<PokemonType>? types;

  PokemonDetails.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        name = map['name'],
        height = map['height'],
        weight = map['weight'],
        types = List<PokemonType>.from(map['types'].map((type) => PokemonType.fromMap(type)));

  String get imagePath {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';
  }
}

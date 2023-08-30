class PokemonType {
  String name;

  PokemonType.fromMap(Map<dynamic, dynamic> map) : name = map['type']['name'];
}

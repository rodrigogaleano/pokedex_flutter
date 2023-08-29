class PokemonDetails {
  String name;

  PokemonDetails.fromMap(Map<dynamic, dynamic> map) : name = map['name'];
}

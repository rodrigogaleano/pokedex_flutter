class Pokemon {
  String name;

  Pokemon.fromMap(Map<dynamic, dynamic> map) : name = map['name'];

  static List<Pokemon> fromMaps(List<dynamic> maps) {
    return maps.map((pokemon) {
      return Pokemon.fromMap(pokemon);
    }).toList();
  }

  String get imagePath {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';
  }
}

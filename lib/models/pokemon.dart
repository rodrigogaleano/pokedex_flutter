class Pokemon {
  String name;

  Pokemon.fromMap(Map<dynamic, dynamic> map) : name = map['name'];

  static List<Pokemon> fromMaps(List<dynamic> maps) {
    return maps.map((pokemon) {
      return Pokemon.fromMap(pokemon);
    }).toList();
  }
}

class Pokemon {
  int id;
  String name;
  String imagePath;

  Pokemon.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        name = map['name'],
        imagePath = map['img'];

  static List<Pokemon> fromMaps(List<dynamic> maps) {
    return maps.map((pokemon) {
      return Pokemon.fromMap(pokemon);
    }).toList();
  }
}

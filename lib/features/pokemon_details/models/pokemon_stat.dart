class PokemonStat {
  String name;
  int baseStat;

  PokemonStat.fromMap(Map<dynamic, dynamic> map)
      : name = map['stat']['name'],
        baseStat = map['base_stat'];
}

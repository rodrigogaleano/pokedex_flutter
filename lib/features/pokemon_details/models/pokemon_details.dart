import 'pokemon_stat.dart';
import 'pokemon_type.dart';

class PokemonDetails {
  int id;
  int height;
  int weight;
  String name;
  List<PokemonType>? types;
  List<PokemonStat> stats;

  PokemonDetails.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        name = map['name'],
        height = map['height'],
        weight = map['weight'],
        types = List<PokemonType>.from(map['types'].map((type) => PokemonType.fromMap(type))),
        stats = List<PokemonStat>.from(map['stats'].map((stat) => PokemonStat.fromMap(stat)));

  String get imagePath {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/';
  }

  String get convertedHeigh {
    return '${height * 10} cm';
  }

  String get convertedWeight {
    return '${weight / 10} kg';
  }
}

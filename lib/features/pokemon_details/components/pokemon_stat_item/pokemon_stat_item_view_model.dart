import '../../models/pokemon_stat.dart';
import 'pokemon_stat_item_view.dart';

class PokemonStatItemViewModel extends PokemonStatItemViewModelProtocol {
  final PokemonStat pokemonStat;

  PokemonStatItemViewModel({required this.pokemonStat});

  @override
  String get name => pokemonStat.name;

  @override
  int get baseStat => pokemonStat.baseStat;
}

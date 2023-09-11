import '../../../../support/extensions/string.dart';
import '../../models/pokemon_stat.dart';
import 'pokemon_stat_item_view.dart';

class PokemonStatItemViewModel extends PokemonStatItemViewModelProtocol {
  final PokemonStat pokemonStat;

  PokemonStatItemViewModel({required this.pokemonStat});

  @override
  String get name => pokemonStat.name.formattedName();

  @override
  double get statPercentage => pokemonStat.baseStat / 100;
}

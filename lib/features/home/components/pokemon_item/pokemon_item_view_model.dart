import '../../../../models/pokemon.dart';
import 'pokemon_item_view.dart';

class PokemonItemViewModel extends PokemonItemViewModelProtocol {
  final Pokemon pokemon;

  PokemonItemViewModel({
    required this.pokemon,
  });

  @override
  String get name => pokemon.name.split(' ').first;

  @override
  String get imagePath => pokemon.imagePath;
}

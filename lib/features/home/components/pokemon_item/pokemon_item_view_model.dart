import '../../../../support/extensions/string.dart';
import '../../models/pokemon.dart';
import 'pokemon_item_view.dart';

abstract class PokemonItemDelegate {
  void didTapPokemon(int pokemonId);
}

class PokemonItemViewModel extends PokemonItemViewModelProtocol {
  final Pokemon pokemon;
  final PokemonItemDelegate? delegate;

  PokemonItemViewModel({
    required this.pokemon,
    required this.delegate,
  });

  @override
  String get name => pokemon.name.formattedName();

  @override
  String get imagePath => pokemon.imagePath;

  @override
  void didTapPokemon(int pokemonId) {
    delegate?.didTapPokemon(pokemonId);
  }
}

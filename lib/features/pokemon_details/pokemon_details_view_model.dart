import 'models/pokemon_details.dart';
import 'pokemon_details_view_controller.dart';
import 'use_cases/get_pokemon_details_use_case.dart';

class PokemonDetailsViewModel extends PokemonDetailsProtocol {
  String errorMessage = '';
  PokemonDetails? _pokemonDetails;

  final int pokemonId;
  final GetPokemonDetailsUseCaseProtocol getPokemonDetailsUseCase;

  PokemonDetailsViewModel({
    required this.pokemonId,
    required this.getPokemonDetailsUseCase,
  });

  @override
  void getPokemonDetails() {
    getPokemonDetailsUseCase.execute(
      pokemonId: pokemonId,
      success: (pokemonDetails) {
        _pokemonDetails = pokemonDetails;
        print(pokemonDetails.name);
      },
      failure: (error) {
        errorMessage = error.description;
      },
    );
  }
}

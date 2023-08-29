import 'package:flutter/material.dart';

import '../../../api/routes/pokemon_routes.dart';
import '../pokemon_details_view_controller.dart';
import '../pokemon_details_view_model.dart';
import '../use_cases/get_pokemon_details_use_case.dart';

class PokemonDetailsFactory {
  static const String pokemonDetailsRoute = '/pokemonDetailsRoute';

  static StatefulWidget pokemonDetails({required int pokemonId}) {
    final routes = PokemonRoutes();
    final getPokemonDetailsUseCase = GetPokemonDetailsUseCase(routes: routes);
    final viewModel = PokemonDetailsViewModel(
      pokemonId: pokemonId,
      getPokemonDetailsUseCase: getPokemonDetailsUseCase,
    );
    return PokemonDetailsViewController(viewModel: viewModel);
  }
}

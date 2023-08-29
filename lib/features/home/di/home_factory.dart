import 'package:flutter/material.dart';

import '../../../api/routes/pokemon_routes.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';
import '../use_cases/get_pokemons_use_case.dart';

class HomeFactory {
  static const String homeRoute = '/home';

  static StatefulWidget home() {
    final route = PokemonRoutes();
    final getPokemonsUseCase = GetPokemonsUseCase(route: route);
    final viewModel = HomeViewModel(getPokemonsUseCase: getPokemonsUseCase);

    return HomeViewController(viewModel: viewModel);
  }
}

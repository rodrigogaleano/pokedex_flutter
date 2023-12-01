import 'package:flutter/material.dart';

import '../features/home/di/home_module.dart';
import '../features/home/home_view_controller.dart';
import '../features/pokemon_details/di/pokemon_details_factory.dart';

class MobileRouter {
  static String initialRoute = HomeModule.homeRoute;

  static final Map<String, WidgetBuilder> routes = {
    /// Home
    HomeModule.homeRoute: (_) => const HomeViewController(),

    /// Pokemon Details
    PokemonDetailsFactory.pokemonDetailsRoute: (context) {
      final pokemonId = ModalRoute.of(context)?.settings.arguments as int;
      return PokemonDetailsFactory.pokemonDetails(pokemonId: pokemonId);
    },
  };
}

import 'package:flutter/material.dart';

import '../features/home/di/home_factory.dart';
import '../features/pokemon_details/di/pokemon_details_factory.dart';

class MobileRouter {
  static String initialRoute = HomeFactory.homeRoute;

  static final Map<String, WidgetBuilder> routes = {
    /// Home
    HomeFactory.homeRoute: (_) => HomeFactory.home(),

    /// Pokemon Details
    PokemonDetailsFactory.pokemonDetailsRoute: (_) => PokemonDetailsFactory.pokemonDetails(),
  };
}

import 'package:flutter/material.dart';

import '../pokemon_details_view_controller.dart';

class PokemonDetailsFactory {
  static const String pokemonDetailsRoute = '/pokemonDetailsRoute';

  static StatefulWidget pokemonDetails() {
    return const PokemonDetailsViewController();
  }
}

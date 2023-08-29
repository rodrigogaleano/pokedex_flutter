import 'package:flutter/material.dart';

import 'pokemon_details_view.dart';

class PokemonDetailsViewController extends StatefulWidget {
  const PokemonDetailsViewController({super.key});

  @override
  State<PokemonDetailsViewController> createState() => _PokemonDetailsViewControllerState();
}

class _PokemonDetailsViewControllerState extends State<PokemonDetailsViewController> {
  @override
  Widget build(BuildContext context) {
    return const PokemonDetailsView();
  }
}

import 'package:flutter/material.dart';

import 'pokemon_details_view.dart';

abstract class PokemonDetailsProtocol {
  void getPokemonDetails();
}

class PokemonDetailsViewController extends StatefulWidget {
  final PokemonDetailsProtocol viewModel;

  const PokemonDetailsViewController({required this.viewModel, super.key});

  @override
  State<PokemonDetailsViewController> createState() => _PokemonDetailsViewControllerState();
}

class _PokemonDetailsViewControllerState extends State<PokemonDetailsViewController> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getPokemonDetails();
  }

  @override
  Widget build(BuildContext context) {
    return const PokemonDetailsView();
  }
}

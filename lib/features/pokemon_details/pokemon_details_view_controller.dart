import 'package:flutter/material.dart';

import 'pokemon_details_view.dart';

abstract class PokemonDetailsProtocol extends PokemonDetailsViewModelProtocol {
  VoidCallback? onTapBack;

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
    _bind();
    widget.viewModel.getPokemonDetails();
  }

  @override
  Widget build(BuildContext context) {
    return PokemonDetailsView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapBack = () {
      Navigator.pop(context);
    };
  }
}

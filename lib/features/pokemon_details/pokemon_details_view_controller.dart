import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import 'pokemon_details_view.dart';

abstract class PokemonDetailsProtocol extends PokemonDetailsViewModelProtocol {
  VoidCallback? onTapBack;

  void getPokemonDetails();
}

class PokemonDetailsViewController extends StatefulWidget {
  final int pokemonId;

  const PokemonDetailsViewController({required this.pokemonId, super.key});

  @override
  State<PokemonDetailsViewController> createState() => _PokemonDetailsViewControllerState();
}

class _PokemonDetailsViewControllerState extends State<PokemonDetailsViewController> {
  late var viewModel = ServiceLocator.get<PokemonDetailsProtocol>();

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<PokemonDetailsProtocol>(
      param: widget.pokemonId,
    );
    _bind();
    viewModel.getPokemonDetails();
  }

  @override
  Widget build(BuildContext context) {
    return PokemonDetailsView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapBack = () {
      Navigator.pop(context);
    };
  }
}

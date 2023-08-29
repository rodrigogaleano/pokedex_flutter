import 'package:flutter/material.dart';

import '../pokemon_details/di/pokemon_details_factory.dart';
import 'home_view.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getPokemons();

  void Function(int pokemonId)? onTapPokemon;
}

class HomeViewController extends StatefulWidget {
  final HomeViewProtocol viewModel;

  const HomeViewController({required this.viewModel, super.key});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
    widget.viewModel.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapPokemon = (pokemonId) {
      Navigator.pushNamed(
        context,
        PokemonDetailsFactory.pokemonDetailsRoute,
        arguments: pokemonId,
      );
    };
  }
}

import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import '../pokemon_details/di/pokemon_details_factory.dart';
import 'home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {
  void getPokemons();

  void Function(int pokemonId)? onTapPokemon;
}

class HomeViewController extends StatefulWidget {
  const HomeViewController({super.key});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  final viewModel = ServiceLocator.get<HomeProtocol>();

  @override
  void initState() {
    super.initState();
    _bind();
    viewModel.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapPokemon = (pokemonId) {
      Navigator.pushNamed(
        context,
        PokemonDetailsFactory.pokemonDetailsRoute,
        arguments: pokemonId,
      );
    };
  }
}

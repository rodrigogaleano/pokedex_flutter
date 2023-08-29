import 'package:flutter/material.dart';

import 'home_view.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getPokemons();
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
    widget.viewModel.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }
}

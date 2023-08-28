import 'package:flutter/material.dart';

abstract class PokemonItemViewModelProtocol {
  String get name;
}

class PokemonItemView extends StatelessWidget {
  final PokemonItemViewModelProtocol viewModel;

  const PokemonItemView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(children: [Text(viewModel.name)]),
    );
  }
}

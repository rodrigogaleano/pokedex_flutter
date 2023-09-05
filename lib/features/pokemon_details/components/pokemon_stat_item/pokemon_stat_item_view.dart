import 'package:flutter/material.dart';

abstract class PokemonStatItemViewModelProtocol {
  String get name;
  int get baseStat;
}

class PokemonStatItemView extends StatelessWidget {
  final PokemonStatItemViewModelProtocol viewModel;

  const PokemonStatItemView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(viewModel.name),
        const SizedBox(width: 20),
        const Expanded(
          child: LinearProgressIndicator(value: 0.5),
        ),
      ],
    );
  }
}

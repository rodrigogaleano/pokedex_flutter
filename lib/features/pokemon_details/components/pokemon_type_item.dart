import 'package:flutter/material.dart';

abstract class PokemonTypeItemViewModelProtocol with ChangeNotifier {
  String get typeName;
}

class PokemonTypeItem extends StatelessWidget {
  final PokemonTypeItemViewModelProtocol viewModel;

  const PokemonTypeItem({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(viewModel.typeName),
    );
  }
}

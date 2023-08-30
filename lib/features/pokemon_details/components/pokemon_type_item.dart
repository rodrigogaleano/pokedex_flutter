import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';

abstract class PokemonTypeItemViewModelProtocol with ChangeNotifier {
  String get typeName;
}

class PokemonTypeItem extends StatelessWidget {
  final PokemonTypeItemViewModelProtocol viewModel;

  const PokemonTypeItem({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightBlue02,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(viewModel.typeName),
    );
  }
}

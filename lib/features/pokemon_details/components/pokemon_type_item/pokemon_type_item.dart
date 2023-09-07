import 'package:flutter/material.dart';

import '../../../../support/style/app_colors.dart';
import '../../../../support/style/app_fonts.dart';

abstract class PokemonTypeItemViewModelProtocol with ChangeNotifier {
  String get typeName;
}

class PokemonTypeItem extends StatelessWidget {
  final PokemonTypeItemViewModelProtocol viewModel;

  const PokemonTypeItem({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        viewModel.typeName,
        style: AppFonts.robotoNormal(
          16,
          AppColors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../support/style/app_colors.dart';
import '../../../../support/style/app_fonts.dart';

abstract class PokemonStatItemViewModelProtocol {
  String get name;
  double get statPercentage;
}

class PokemonStatItemView extends StatelessWidget {
  final PokemonStatItemViewModelProtocol viewModel;

  const PokemonStatItemView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.2,
                child: Text(
                  viewModel.name,
                  style: AppFonts.robotoNormal(16),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  value: viewModel.statPercentage,
                  color: AppColors.blue,
                  backgroundColor: AppColors.lightBlue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

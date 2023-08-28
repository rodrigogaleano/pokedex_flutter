import 'package:flutter/material.dart';

import '../../../../support/components/cached_image.dart';
import '../../../../support/style/app_colors.dart';
import '../../../../support/style/app_fonts.dart';

abstract class PokemonItemViewModelProtocol {
  String get name;
  String get number;
  String get imagePath;
}

class PokemonItemView extends StatelessWidget {
  final PokemonItemViewModelProtocol viewModel;

  const PokemonItemView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.lightBlue02,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CachedImage(
              url: viewModel.imagePath,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            viewModel.name,
            style: AppFonts.robotoSemiBold(18, AppColors.black),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            viewModel.number,
            style: AppFonts.robotoLight(16, AppColors.black),
          ),
        ],
      ),
    );
  }
}

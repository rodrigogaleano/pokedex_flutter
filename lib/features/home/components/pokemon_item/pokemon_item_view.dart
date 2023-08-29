import 'package:flutter/material.dart';

import '../../../../support/components/cached_image.dart';
import '../../../../support/style/app_colors.dart';
import '../../../../support/style/app_fonts.dart';

abstract class PokemonItemViewModelProtocol {
  String get name;
  String get imagePath;

  void didTapPokemon(int pokemonId);
}

class PokemonItemView extends StatelessWidget {
  final PokemonItemViewModelProtocol viewModel;
  final int pokemonId;

  const PokemonItemView({
    required this.viewModel,
    required this.pokemonId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewModel.didTapPokemon(pokemonId),
      child: Container(
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
                url: '${viewModel.imagePath}$pokemonId.png',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              viewModel.name,
              style: AppFonts.robotoSemiBold(18, AppColors.black),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              pokemonId.toString().padLeft(3, '0'),
              style: AppFonts.robotoLight(16, AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}

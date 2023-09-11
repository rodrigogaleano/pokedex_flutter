import 'package:flutter/material.dart';

import '../../../support/components/shimmer_loading_placeholder.dart';
import '../../../support/style/app_colors.dart';

class PokemonDetailsLoadingPlaceholder extends StatelessWidget {
  const PokemonDetailsLoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        children: [
          ShimmerLoadingPlaceholder(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: const AspectRatio(aspectRatio: 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShimmerLoadingPlaceholder(
                child: Container(
                  width: 96,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              ShimmerLoadingPlaceholder(
                child: Container(
                  width: 96,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../support/components/shimmer_loading_placeholder.dart';
import '../../../support/style/app_colors.dart';

class HomeLoadingPlaceholder extends StatelessWidget {
  const HomeLoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 8,
          (_, index) {
            return ShimmerLoadingPlaceholder(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

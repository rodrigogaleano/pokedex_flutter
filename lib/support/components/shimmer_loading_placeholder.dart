import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../style/app_colors.dart';

class ShimmerLoadingPlaceholder extends StatelessWidget {
  final Widget child;

  const ShimmerLoadingPlaceholder({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightBlue,
      highlightColor: AppColors.white,
      child: child,
    );
  }
}

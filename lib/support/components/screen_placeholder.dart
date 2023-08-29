import 'package:flutter/cupertino.dart';

import '../style/app_assets.dart';
import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class ScreenPlaceholder extends StatelessWidget {
  final String label;
  const ScreenPlaceholder({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            AppAssets.icPlaceholder,
            width: 96,
            height: 96,
          ),
          Text(
            label,
            style: AppFonts.robotoSemiBold(16, AppColors.black),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

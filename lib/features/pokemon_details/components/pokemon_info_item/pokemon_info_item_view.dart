import 'package:flutter/material.dart';

import '../../../../support/style/app_colors.dart';
import '../../../../support/style/app_fonts.dart';

class PokemonInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const PokemonInfoItem({
    required this.label,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(
          label,
          style: AppFonts.robotoNormal(16, AppColors.black),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppFonts.robotoSemiBold(18, AppColors.black),
        ),
      ],
    );
  }
}

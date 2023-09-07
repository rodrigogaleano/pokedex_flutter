import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData theme = ThemeData(
    /// Scaffold
    scaffoldBackgroundColor: AppColors.white,

    /// AppBar
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
  );
}

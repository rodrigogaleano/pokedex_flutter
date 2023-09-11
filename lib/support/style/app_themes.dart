import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData theme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    /// Scaffold
    scaffoldBackgroundColor: AppColors.white,

    /// AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
  );
}

import 'package:flutter/material.dart';

class ThemeProvider {
  ThemeProvider.internal();
  static final ThemeProvider _instance = ThemeProvider.internal();

  factory ThemeProvider() {
    return _instance;
  }

  ThemeData get light => ThemeData.light().copyWith(
      useMaterial3: true,
      splashFactory: InkRipple.splashFactory,
      typography: Typography.material2021(),
      snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating
      ),
      cardTheme: CardTheme(
          clipBehavior: Clip.hardEdge
      )
  );

  ThemeData get dark => ThemeData.dark().copyWith(
      useMaterial3: true,
      splashFactory: InkRipple.splashFactory,
      typography: Typography.material2021(),
      snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating
      ),
      cardTheme: CardTheme(
          clipBehavior: Clip.hardEdge
      )
  );
}
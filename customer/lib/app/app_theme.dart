import 'package:flutter/material.dart';

// light
// onSurface = Colors.black
// onInverseSurface = surface = Colors.white
class AppTheme {
  static MaterialColor? colorSchemeSeed;
  //
  static ThemeData _lightTheme() {
    final colorScheme = ColorScheme.fromSwatch().copyWith(
      surfaceTint: Colors.white, // ArlertDialog background
    );

    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface, //
      canvasColor: colorScheme.surface,
      expansionTileTheme: expansionTileThemeData(),
      appBarTheme: AppBarTheme(
        shadowColor: Colors.grey.shade300,
        titleTextStyle: TextStyle(color: colorScheme.onSurface, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      dialogTheme: DialogThemeData(backgroundColor: colorScheme.surface),
    );
  }

  static ThemeData _darkTheme() {
    return ThemeData.dark().copyWith(
      expansionTileTheme: expansionTileThemeData(),
      appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }

  static ThemeData lightTheme = _lightTheme();
  static ThemeData darkTheme = _darkTheme();

  static ExpansionTileThemeData expansionTileThemeData() {
    return ExpansionTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(width: 0.1)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      childrenPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
    );
  }
}

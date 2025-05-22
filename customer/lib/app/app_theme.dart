import 'package:flutter/material.dart';

import 'app_constants.dart';

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
    const hintColor = Colors.grey;

    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface, //
      canvasColor: colorScheme.surface,
      hintColor: hintColor,
      elevatedButtonTheme: elevatedButtonTheme(colorScheme: colorScheme),
      filledButtonTheme: filledButtonTheme(colorScheme: colorScheme),
      outlinedButtonTheme: outlinedButtonTheme(colorScheme: colorScheme),
      inputDecorationTheme: inputDecorationTheme(hintColor: hintColor, colorScheme: colorScheme),
      expansionTileTheme: expansionTileThemeData(),
      appBarTheme: AppBarTheme(
        shadowColor: Colors.grey.shade300,
        titleTextStyle: TextStyle(color: colorScheme.onSurface, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      dialogTheme: DialogThemeData(backgroundColor: colorScheme.surface),
    );
  }

  static ThemeData _darkTheme() {
    final theme = ThemeData.dark();
    return theme.copyWith(
      elevatedButtonTheme: elevatedButtonTheme(colorScheme: theme.colorScheme),
      filledButtonTheme: filledButtonTheme(colorScheme: theme.colorScheme),
      outlinedButtonTheme: outlinedButtonTheme(colorScheme: theme.colorScheme),
      inputDecorationTheme: inputDecorationTheme(hintColor: theme.hintColor, colorScheme: theme.colorScheme),
      expansionTileTheme: expansionTileThemeData(),
      appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }

  static ThemeData lightTheme = _lightTheme();
  static ThemeData darkTheme = _darkTheme();

  static InputDecorationTheme inputDecorationTheme({Color? hintColor, ColorScheme? colorScheme}) {
    hintColor ??= Colors.black;

    return InputDecorationTheme(
      // filled: true,
      // fillColor: ColorConstants.getMaterialColor(hintColor).shade50.withValues(alpha: 0.5), //AppColorConstants.hexToColor("#FAFAFB"),
      contentPadding: EdgeInsets.zero,
      labelStyle: TextStyle(color: hintColor),
      border: const OutlineInputBorder(borderRadius: AppConstants.borderRadius),
      enabledBorder: OutlineInputBorder(borderRadius: AppConstants.borderRadius, borderSide: BorderSide(color: hintColor, width: 0.5)),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppConstants.borderRadius,
        borderSide: BorderSide(color: colorScheme?.primary ?? hintColor, width: 0.5),
      ),
      disabledBorder: OutlineInputBorder(borderRadius: AppConstants.borderRadius, borderSide: BorderSide(color: hintColor, width: 0.05)),
    );
  }

  static EdgeInsetsGeometry get paddingButtonTheme => const EdgeInsets.symmetric(vertical: 15);

  static ElevatedButtonThemeData elevatedButtonTheme({ColorScheme? colorScheme}) =>
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: AppConstants.borderRadius)));

  static FilledButtonThemeData filledButtonTheme({ColorScheme? colorScheme}) => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: paddingButtonTheme,
      foregroundColor: colorScheme?.surface,
      shape: const RoundedRectangleBorder(borderRadius: AppConstants.borderRadius),
    ),
  );

  static OutlinedButtonThemeData outlinedButtonTheme({ColorScheme? colorScheme}) => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(borderRadius: AppConstants.borderRadius),
      side: BorderSide(width: 0.5, color: colorScheme?.primary ?? Colors.black),
    ),
  );

  static ExpansionTileThemeData expansionTileThemeData() {
    return ExpansionTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(width: 0.1)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

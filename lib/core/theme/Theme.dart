// File: lib/core/theme/theme_from_palette.dart
import 'package:flutter/material.dart';
import 'package:marketnest/core/theme/ColorPalette.dart';

ThemeData themeFromPalette(ColorPalette p) {
  return ThemeData(
    brightness: p.isDarkMode ? Brightness.dark : Brightness.light,
    primaryColor: p.primary,
    scaffoldBackgroundColor: p.background,
    cardColor: p.surface,
    dividerColor: p.divider,
    // errorColor: p.error,
    disabledColor: p.disabledHint,
    colorScheme: (p.isDarkMode ? const ColorScheme.dark() : const ColorScheme.light()).copyWith(
      primary: p.primary,
      background: p.background,
      surface: p.surface,
      onPrimary: p.textPrimary,
      onSurface: p.textPrimary,
      error: p.error,
      secondary: p.accent,
    ),
    appBarTheme: AppBarTheme(
      color: p.background,
      foregroundColor: p.textPrimary,
      elevation: 0,
      iconTheme: IconThemeData(color: p.textPrimary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: p.primary,
        foregroundColor: p.textPrimary,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: p.textPrimary),
      headlineMedium: TextStyle(color: p.textPrimary),
      headlineSmall: TextStyle(color: p.textPrimary),
      titleMedium: TextStyle(color: p.textPrimary),
      titleLarge: TextStyle(color: p.textPrimary),
      titleSmall: TextStyle(color: p.textPrimary),
      bodyLarge: TextStyle(color: p.textSecondary),
      bodyMedium: TextStyle(color: p.textSecondary),
      bodySmall: TextStyle(color: p.textSecondary),
    ),
  );
}

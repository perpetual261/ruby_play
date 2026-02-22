import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF900603);
  static const Color accent = Color(0xFFBC544B);
  static const Color background = Color(0xFF121212);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(primary: primary, secondary: accent),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(primary: primary, secondary: accent),
    scaffoldBackgroundColor: background,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.grey),
    ),
  );
}

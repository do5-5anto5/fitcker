import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.white70,
    surface: Color(0xff6B46C1),
    onSurface: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff6B46C1),
    elevation: 0,
  ),
  scaffoldBackgroundColor: const Color(0xffD69E2E),
  cardTheme: CardThemeData(
    color: const Color(0xff6B46C1),
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  tabBarTheme: const TabBarThemeData(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white60,
    indicatorColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xff6B46C1),
  ),
);

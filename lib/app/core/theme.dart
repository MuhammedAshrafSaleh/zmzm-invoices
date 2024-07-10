import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFF8A12D);
  static const Color secondaryColor = Color(0xFFF5832D);
  static const Color redColor = Color(0xFFEF3B2A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFF7F8F9);
  static const Color midGrey = Color(0xFF8391A1);
  static const Color darkGrey = Color(0xFF6A707C);
  static const Color simpleGrey = Color(0xFFDADADA);
  
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: midGrey,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 14,
        color: primaryColor,
      ),
    ),
  );
}

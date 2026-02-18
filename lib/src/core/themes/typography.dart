import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'IRANSansXFaNum';  // اینجا همون family name از pubspec

  // وزن‌ها
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;

  // TextTheme کامل
  static TextTheme get textTheme => const TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 72,
      fontWeight: FontWeight.w700,
      height: 1.0,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 60,
      fontWeight: FontWeight.w700,
      height: 1.0,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 48,
      fontWeight: FontWeight.w700,
      height: 1.0,
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      height: 1.1,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.3,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
  );
}

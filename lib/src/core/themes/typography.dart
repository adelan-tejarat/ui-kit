import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily =
      'IRANSansXFaNum'; // اینجا همون family name از pubspec

  // وزن‌ها
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;

  // text-7xl
  static const text7xl = TextStyle(
    fontFamily: fontFamily,
    fontSize: 72,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  // text-6xl
  static const text6xl = TextStyle(
    fontFamily: fontFamily,
    fontSize: 60,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  // text-5xl
  static const text5xl = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  // text-4xl
  static const text4xl = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.1,
  );

  // text-3xl
  static const text3xl = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  // text-2xl
  static const text2xl = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  // text-xl
  static const textXl = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  // text-lg
  static const textLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.55,
  );

  // text-base
  static const textBase = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.33,
  );

  // text-sm
  static const textSm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.42,
  );

  // text-xs
  static const textXs = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
  );

  // TextTheme کامل
  static TextTheme get textTheme => const TextTheme(
    // text-7xl
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 72,
      fontWeight: FontWeight.w700,
      height: 1.0,
    ),
    // text-6xl
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 60,
      fontWeight: FontWeight.w700,
      height: 1.0,
    ),
    // text-5xl
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 48,
      fontWeight: FontWeight.w700,
      height: 1.0,
    ),
    // text-4xl
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 1.1,
    ),
    // text-3xl
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    // text-2xl
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),

    // text-xl
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    // text-lg
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.55,
    ),
    // text-base
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.33,
    ),
    // text-sm
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.42,
    ),
    // text-xs
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.33,
    ),
  );
}

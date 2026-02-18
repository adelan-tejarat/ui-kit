import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:vamstreet_components/src/core/utils/blur_utils.dart' show BlurUtils;

class AppBlur {
  AppBlur._();

  // Blur values in pixels
  static const double none = 0;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xl2 = 24;
  static const double xl3 = 32;

  // دریافت ImageFilter برای هر سطح
  static ImageFilter getFilter(double value) {
    return BlurUtils.toImageFilter(value);
  }

  // ImageFilter برای هر سطح (با نام‌های مشخص)
  static ImageFilter get noneFilter => BlurUtils.toImageFilter(none);
  static ImageFilter get xsFilter => BlurUtils.toImageFilter(xs);
  static ImageFilter get smFilter => BlurUtils.toImageFilter(sm);
  static ImageFilter get mdFilter => BlurUtils.toImageFilter(md);
  static ImageFilter get lgFilter => BlurUtils.toImageFilter(lg);
  static ImageFilter get xlFilter => BlurUtils.toImageFilter(xl);
  static ImageFilter get xl2Filter => BlurUtils.toImageFilter(xl2);
  static ImageFilter get xl3Filter => BlurUtils.toImageFilter(xl3);

  // دریافت BackdropFilter آماده
  static Widget backdrop({
    required double blur,
    required Widget child,
    BlendMode blendMode = BlendMode.srcOver,
  }) {
    return BlurUtils.toBackdropFilter(
      blurValue: blur,
      child: child,
      blendMode: blendMode,
    );
  }

  // متدهای کمکی
  static String getName(double value) => BlurUtils.getBlurName(value);
  static double fromName(String name) => BlurUtils.fromString(name);
  static bool isValid(double value) => BlurUtils.isValidBlur(value);
}

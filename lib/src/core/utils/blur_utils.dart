import 'dart:ui';
import 'package:flutter/widgets.dart';

class BlurUtils {
  BlurUtils._();

  // تبدیل مقدار blur به ImageFilter
  static ImageFilter toImageFilter(double blurValue) {
    return ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue);
  }

  // تبدیل به BackdropFilter با child
  static Widget toBackdropFilter({
    required double blurValue,
    required Widget child,
    BlendMode blendMode = BlendMode.srcOver,
  }) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
      blendMode: blendMode,
      child: child,
    );
  }

  // اعمال blur روی رنگ
  static Color applyBlurToColor(Color color, double blurValue) {
    // این یه شبیه‌سازی سادست - در واقعیت blur روی رنگ معنی نداره
    return color.withOpacity(color.opacity * (1 - (blurValue / 100)).clamp(0.1, 1.0));
  }

  // تبدیل blur به درصد برای نمایش
  static double toPercentage(double blurValue, double maxBlur) {
    return (blurValue / maxBlur * 100).clamp(0, 100);
  }

  // بررسی معتبر بودن مقدار blur
  static bool isValidBlur(double blurValue) {
    return blurValue >= 0;
  }

  // دریافت نام مناسب برای مقدار blur
  static String getBlurName(double blurValue) {
    if (blurValue == 0) return 'blur-none';
    if (blurValue <= 4) return 'blur-xs';
    if (blurValue <= 8) return 'blur-sm';
    if (blurValue <= 12) return 'blur-md';
    if (blurValue <= 16) return 'blur-lg';
    if (blurValue <= 20) return 'blur-xl';
    if (blurValue <= 24) return 'blur-2xl';
    return 'blur-3xl';
  }

  // تبدیل string به مقدار blur
  static double fromString(String blurName) {
    switch (blurName) {
      case 'blur-none': return 0;
      case 'blur-xs': return 4;
      case 'blur-sm': return 8;
      case 'blur-md': return 12;
      case 'blur-lg': return 16;
      case 'blur-xl': return 20;
      case 'blur-2xl': return 24;
      case 'blur-3xl': return 32;
      default: return 0;
    }
  }
}

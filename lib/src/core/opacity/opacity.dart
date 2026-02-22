import 'package:flutter/widgets.dart';

class AppOpacity {
  AppOpacity._();

  // Opacity values (0 to 1)
  static const double opacity0 = 0.0;
  static const double opacity5 = 0.05;
  static const double opacity10 = 0.1;
  static const double opacity15 = 0.15;
  static const double opacity20 = 0.2;
  static const double opacity25 = 0.25;
  static const double opacity30 = 0.3;
  static const double opacity35 = 0.35;
  static const double opacity40 = 0.4;
  static const double opacity45 = 0.45;
  static const double opacity50 = 0.5;
  static const double opacity55 = 0.55;
  static const double opacity60 = 0.6;
  static const double opacity65 = 0.65;
  static const double opacity70 = 0.7;
  static const double opacity75 = 0.75;
  static const double opacity80 = 0.8;
  static const double opacity85 = 0.85;
  static const double opacity90 = 0.9;
  static const double opacity95 = 0.95;
  static const double opacity100 = 1.0;

  // Named getters for common use cases
  static double get none => opacity0;
  static double get full => opacity100;
  static double get half => opacity50;
  static double get quarter => opacity25;
  static double get threeQuarters => opacity75;

  // Apply opacity to a widget
  static Widget apply({
    required double value,
    required Widget child,
  }) {
    return Opacity(
      opacity: value,
      child: child,
    );
  }

  // Apply opacity to a color
  static Color toColor(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  // Check if opacity is valid
  static bool isValid(double value) {
    return value >= 0.0 && value <= 1.0;
  }

  // Get opacity value from percentage (0-100)
  static double fromPercentage(int percentage) {
    return (percentage / 100).clamp(0.0, 1.0);
  }

  // Get percentage from opacity value
  static int toPercentage(double opacity) {
    return (opacity * 100).round();
  }

  // Get name from opacity value
  static String getName(double value) {
    int percentage = toPercentage(value);
    return 'opacity-$percentage';
  }

  // Get opacity value from name
  static double fromName(String name) {
    final RegExp regex = RegExp(r'opacity-(\d+)');
    final match = regex.firstMatch(name);
    if (match != null) {
      int percentage = int.parse(match.group(1)!);
      return percentage / 100;
    }
    return opacity100;
  }

  // Get all opacity values as list
  static List<double> get allValues => [
    opacity0, opacity5, opacity10, opacity15, opacity20,
    opacity25, opacity30, opacity35, opacity40, opacity45,
    opacity50, opacity55, opacity60, opacity65, opacity70,
    opacity75, opacity80, opacity85, opacity90, opacity95,
    opacity100,
  ];

  // Get all opacity names as list
  static List<String> get allNames => allValues.map((v) => getName(v)).toList();
}
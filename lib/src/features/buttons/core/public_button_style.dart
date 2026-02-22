import 'package:flutter/material.dart';
import 'package:vamstreet_components/src/features/buttons/core/button_size.dart' show ButtonSize;
import 'package:vamstreet_components/src/features/buttons/core/button_styles.dart' show ButtonStyles;

class ButtonWidgetStyle {
  final EdgeInsets padding;
  final double borderRadius;
  final Size size;

  ButtonWidgetStyle({
    required this.padding,
    required this.borderRadius,
    required this.size,
  });

  static ButtonWidgetStyle of(ButtonSize size) {
    switch (size) {
      case ButtonSize.xlg:
        return ButtonWidgetStyle(
          padding: const EdgeInsets.all(ButtonStyles.spacing4),
          borderRadius: ButtonStyles.fontSizeXlg,
          size: ButtonStyles.xlg,
        );
      case ButtonSize.lg:
        return ButtonWidgetStyle(
          padding: const EdgeInsets.symmetric(
            vertical: ButtonStyles.spacing3,
            horizontal: ButtonStyles.spacing4,
          ),
          borderRadius: ButtonStyles.fontSizeLg,
          size: ButtonStyles.lg,
        );
      case ButtonSize.md:
        return ButtonWidgetStyle(
          padding: const EdgeInsets.symmetric(
            vertical: ButtonStyles.spacing2,
            horizontal: ButtonStyles.spacing4,
          ),
          borderRadius: ButtonStyles.fontSizeMd,
          size: ButtonStyles.md,
        );
    }
  }
}

import 'package:vamstreet_uikit/src/features/selectable/core/radio_color_details.dart';
import 'package:vamstreet_uikit/src/features/selectable/core/radio_color_state.dart';

import '../../../core/themes/app_colors.dart';

class RadioColorPacks {
  const RadioColorPacks._();

  static const brand = _RadioStateSet(
    enabled: RadioColorDetails(
      border: AppColors.neutral400,
      dot: AppColors.brand600,
      text: AppColors.neutral900,
    ),
    hovered: RadioColorDetails(
      border: AppColors.brand600,
      dot: AppColors.brand600,
      text: AppColors.brand700,
    ),
    focused: RadioColorDetails(
      border: AppColors.brand700,
      dot: AppColors.brand700,
      text: AppColors.brand700,
    ),
    disabled: RadioColorDetails(
      border: AppColors.neutral300,
      dot: AppColors.neutral400,
      text: AppColors.neutral400,
    ),
    selected: RadioColorDetails(
      border: AppColors.brand600,
      dot: AppColors.brand600,
      text: AppColors.neutral900,
    ),
  );
}

class _RadioStateSet {
  final RadioColorDetails enabled;
  final RadioColorDetails? disabled;
  final RadioColorDetails? hovered;
  final RadioColorDetails? focused;
  final RadioColorDetails? selected;

  const _RadioStateSet({
    required this.enabled,
    this.disabled,
    this.hovered,
    this.focused,
    this.selected,
  });

  RadioColorDetails resolve(RadioColorState state) {
    switch (state) {
      case RadioColorState.disabled:
        return disabled ?? enabled;
      case RadioColorState.hovered:
        return hovered ?? enabled;
      case RadioColorState.focused:
        return focused ?? enabled;
      case RadioColorState.selected:
        return selected ?? enabled;
      case RadioColorState.enabled:
      default:
        return enabled;
    }
  }
}

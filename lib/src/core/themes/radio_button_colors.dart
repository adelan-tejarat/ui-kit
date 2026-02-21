import 'app_colors.dart';

/// ============================================================
/// ENUMS
/// ============================================================

enum ButtonColorState { enabled, disabled, hovered, focused, loading }

enum ButtonMode { filled, outline, standard }

enum ApiRequestState { initial, loading, loaded, error }

enum ColorPack { brand, green, red, neutral }

/// ============================================================
/// COLOR DETAILS
/// ============================================================

class ButtonColorDetails {
  final int background;
  final int border;
  final int foreground;

  const ButtonColorDetails({
    required this.background,
    required this.border,
    required this.foreground,
  });
}

/// ============================================================
/// STATE MAP (Fully const - No Map used)
/// ============================================================

class _ButtonStateSet {
  final ButtonColorDetails enabled;
  final ButtonColorDetails? disabled;
  final ButtonColorDetails? hovered;
  final ButtonColorDetails? focused;
  final ButtonColorDetails? loading;

  const _ButtonStateSet({
    required this.enabled,
    this.disabled,
    this.hovered,
    this.focused,
    this.loading,
  });

  ButtonColorDetails resolve(ButtonColorState state) {
    switch (state) {
      case ButtonColorState.disabled:
        return disabled ?? enabled;
      case ButtonColorState.hovered:
        return hovered ?? enabled;
      case ButtonColorState.focused:
        return focused ?? enabled;
      case ButtonColorState.loading:
        return loading ?? enabled;
      case ButtonColorState.enabled:
      default:
        return enabled;
    }
  }
}

/// ============================================================
/// MODE SET
/// ============================================================

class _ButtonModeSet {
  final _ButtonStateSet filled;
  final _ButtonStateSet outline;
  final _ButtonStateSet standard;

  const _ButtonModeSet({
    required this.filled,
    required this.outline,
    required this.standard,
  });

  ButtonColorDetails resolve(ButtonMode mode, ButtonColorState state) {
    switch (mode) {
      case ButtonMode.filled:
        return filled.resolve(state);
      case ButtonMode.outline:
        return outline.resolve(state);
      case ButtonMode.standard:
        return standard.resolve(state);
    }
  }
}

/// ============================================================
/// COLOR PACKS (100% CONST)
/// ============================================================

class ButtonColorPacks {
  const ButtonColorPacks._();

  /// ---------------- BRAND ----------------

  static const brand = _ButtonModeSet(
    filled: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.brand500,
        border: AppColors.brand500,
        foreground: AppColors.white,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.brand600,
        border: AppColors.brand600,
        foreground: AppColors.white,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.neutral300,
        border: AppColors.neutral300,
        foreground: AppColors.neutral500,
      ),
      focused: ButtonColorDetails(
        background: AppColors.brand600,
        border: AppColors.brand700,
        foreground: AppColors.white,
      ),
      loading: ButtonColorDetails(
        background: AppColors.brand500,
        border: AppColors.brand500,
        foreground: AppColors.white,
      ),
    ),
    outline: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.white,
        border: AppColors.brand500,
        foreground: AppColors.brand500,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.brand50,
        border: AppColors.brand600,
        foreground: AppColors.brand600,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.white,
        border: AppColors.neutral300,
        foreground: AppColors.neutral400,
      ),
    ),
    standard: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.white,
        border: AppColors.white,
        foreground: AppColors.brand600,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.brand50,
        border: AppColors.white,
        foreground: AppColors.brand700,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.white,
        border: AppColors.white,
        foreground: AppColors.neutral400,
      ),
    ),
  );

  /// ---------------- GREEN ----------------

  static const green = _ButtonModeSet(
    filled: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.green500,
        border: AppColors.green500,
        foreground: AppColors.white,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.green600,
        border: AppColors.green600,
        foreground: AppColors.white,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.neutral300,
        border: AppColors.neutral300,
        foreground: AppColors.neutral500,
      ),
      focused: ButtonColorDetails(
        background: AppColors.green600,
        border: AppColors.green700,
        foreground: AppColors.white,
      ),
      loading: ButtonColorDetails(
        background: AppColors.green500,
        border: AppColors.green500,
        foreground: AppColors.white,
      ),
    ),
    outline: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.white,
        border: AppColors.green600,
        foreground: AppColors.green600,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.green50,
        border: AppColors.green700,
        foreground: AppColors.green700,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.white,
        border: AppColors.neutral300,
        foreground: AppColors.neutral400,
      ),
    ),
    standard: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.white,
        border: AppColors.white,
        foreground: AppColors.green700,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.green50,
        border: AppColors.white,
        foreground: AppColors.green800,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.white,
        border: AppColors.white,
        foreground: AppColors.neutral400,
      ),
    ),
  );

  /// ---------------- RED ----------------

  static const red = _ButtonModeSet(
    filled: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.red600,
        border: AppColors.red600,
        foreground: AppColors.white,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.red700,
        border: AppColors.red700,
        foreground: AppColors.white,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.neutral300,
        border: AppColors.neutral300,
        foreground: AppColors.neutral500,
      ),
      focused: ButtonColorDetails(
        background: AppColors.red700,
        border: AppColors.red800,
        foreground: AppColors.white,
      ),
      loading: ButtonColorDetails(
        background: AppColors.red600,
        border: AppColors.red600,
        foreground: AppColors.white,
      ),
    ),
    outline: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.transparent,
        border: AppColors.red600,
        foreground: AppColors.red600,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.red50,
        border: AppColors.red700,
        foreground: AppColors.red700,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.transparent,
        border: AppColors.neutral300,
        foreground: AppColors.neutral400,
      ),
    ),
    standard: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.transparent,
        border: AppColors.transparent,
        foreground: AppColors.red700,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.red50,
        border: AppColors.transparent,
        foreground: AppColors.red800,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.transparent,
        border: AppColors.transparent,
        foreground: AppColors.neutral400,
      ),
    ),
  );

  /// ---------------- NEUTRAL ----------------

  static const neutral = _ButtonModeSet(
    filled: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.neutral800,
        border: AppColors.neutral800,
        foreground: AppColors.white,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.neutral900,
        border: AppColors.neutral900,
        foreground: AppColors.white,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.neutral300,
        border: AppColors.neutral300,
        foreground: AppColors.neutral500,
      ),
      focused: ButtonColorDetails(
        background: AppColors.neutral900,
        border: AppColors.black,
        foreground: AppColors.white,
      ),
      loading: ButtonColorDetails(
        background: AppColors.neutral800,
        border: AppColors.neutral800,
        foreground: AppColors.white,
      ),
    ),
    outline: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.transparent,
        border: AppColors.neutral700,
        foreground: AppColors.neutral700,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.neutral100,
        border: AppColors.neutral800,
        foreground: AppColors.neutral800,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.transparent,
        border: AppColors.neutral300,
        foreground: AppColors.neutral400,
      ),
    ),
    standard: _ButtonStateSet(
      enabled: ButtonColorDetails(
        background: AppColors.transparent,
        border: AppColors.transparent,
        foreground: AppColors.neutral800,
      ),
      hovered: ButtonColorDetails(
        background: AppColors.neutral100,
        border: AppColors.transparent,
        foreground: AppColors.neutral900,
      ),
      disabled: ButtonColorDetails(
        background: AppColors.transparent,
        border: AppColors.transparent,
        foreground: AppColors.neutral400,
      ),
    ),
  );

  /// ============================================================

  static const _map = {
    ColorPack.brand: brand,
    ColorPack.green: green,
    ColorPack.red: red,
    ColorPack.neutral: neutral,
  };

  static _ButtonModeSet of(ColorPack pack) => _map[pack] ?? brand;
}

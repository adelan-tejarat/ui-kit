import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/src/core/themes/button_colors.dart';
import 'package:vamstreet_uikit/src/features/buttons/core/button_size.dart'
    show ButtonSize;
import 'package:vamstreet_uikit/src/features/buttons/core/public_button_style.dart'
    show ButtonWidgetStyle;
import 'package:vamstreet_uikit/src/features/loading_widget.dart'
    show ButtonLoading;
import 'package:vamstreet_uikit/vamstreet_uikit.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ColorPack colorPack;
  final ButtonMode mode;
  final ButtonSize size;
  final ApiRequestState apiState;
  final IconData? prefixIcon; // پریفیکس آیکون از نوع IconData
  final IconData? suffixIcon; // سافیکس آیکون از نوع IconData
  final double? iconSize; // سایز آیکون (اختیاری)

  const ButtonWidget({
    required this.text,
    required this.colorPack,
    required this.onPressed,
    this.mode = ButtonMode.filled,
    this.size = ButtonSize.md,
    this.apiState = ApiRequestState.initial,
    this.prefixIcon,
    this.suffixIcon,
    this.iconSize, // پارامتر جدید برای سایز آیکون
    super.key,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _hovered = false;
  bool _focused = false;

  bool get _isLoading => widget.apiState == ApiRequestState.loading;

  // در حالت لودینگ، دیزیلد محسوب نمیشه
  bool get _isDisabled => widget.onPressed == null && !_isLoading;

  ButtonColorState _resolveUiState() {
    if (_isLoading) return ButtonColorState.loading; // اولویت با لودینگ
    if (_isDisabled) return ButtonColorState.disabled;
    if (_focused) return ButtonColorState.focused;
    if (_hovered) return ButtonColorState.hovered;
    return ButtonColorState.enabled;
  }

  // محاسبه سایز آیکون بر اساس سایز دکمه
  double _getIconSize() {
    // اگر کاربر سایز مشخص کرده باشد، از همان استفاده کن
    if (widget.iconSize != null) {
      return widget.iconSize!;
    }

    // در غیر این صورت بر اساس سایز دکمه تعیین کن
    switch (widget.size) {
      case ButtonSize.md:
        return 16;
      case ButtonSize.lg:
        return 18;
      case ButtonSize.xlg:
        return 20;
    }
  }

  @override
  Widget build(BuildContext context) {
    final uiState = _resolveUiState();
    final colors = ButtonColorPacks.of(
      widget.colorPack,
    ).resolve(widget.mode, uiState);
    final style = ButtonWidgetStyle.of(widget.size);
    final iconSize = _getIconSize();

    return SizedBox(
      width: style.size.width,
      height: style.size.height,
      child: FocusableActionDetector(
        onShowFocusHighlight: (v) => setState(() => _focused = v),
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: ElevatedButton(
            // در حالت لودینگ، onPressed رو null میکنیم تا دکمه غیرفعال باشه
            onPressed: (_isLoading || _isDisabled) ? null : widget.onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(colors.background),
              ),
              foregroundColor: MaterialStateProperty.all(
                Color(colors.foreground),
              ),
              side: MaterialStateProperty.all(
                BorderSide(color: Color(colors.border)),
              ),
              padding: MaterialStateProperty.all(style.padding),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(style.borderRadius),
                ),
              ),
              elevation: MaterialStateProperty.all(0),
            ),
            child: _isLoading
                ? ButtonLoading(
                    size: widget.size,
                    color: Color(colors.foreground),
                  )
                : _buildContent(colors.foreground, iconSize),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(int foregroundColor, double iconSize) {
    // اگر هیچ آیکونی وجود نداشت، فقط متن را برگردان
    if (widget.prefixIcon == null && widget.suffixIcon == null) {
      return Text(widget.text, style: AppTypography.textBase);
    }

    // لیست فرزندان Row
    final List<Widget> children = [];

    // پریفیکس آیکون
    if (widget.prefixIcon != null) {
      children.add(
        Icon(widget.prefixIcon, size: iconSize, color: Color(foregroundColor)),
      );
      children.add(const SizedBox(width: 8)); // فاصله 8 پیکسل
    }

    // متن
    children.add(
      Flexible(
        child: Text(
          widget.text,
          style: AppTypography.textBase,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    // سافیکس آیکون
    if (widget.suffixIcon != null) {
      children.add(const SizedBox(width: 8)); // فاصله 8 پیکسل
      children.add(
        Icon(widget.suffixIcon, size: iconSize, color: Color(foregroundColor)),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

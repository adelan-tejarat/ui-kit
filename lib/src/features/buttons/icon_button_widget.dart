import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/src/core/themes/button_colors.dart';
import 'package:vamstreet_uikit/src/features/buttons/core/button_size.dart'
    show ButtonSize;
import 'package:vamstreet_uikit/src/features/buttons/core/public_button_style.dart'
    show ButtonWidgetStyle;
import 'package:vamstreet_uikit/src/features/loading_widget.dart' show ButtonLoading;

class IconButtonWidget extends StatefulWidget {
  final IconData? icon;
  final VoidCallback? onPressed;
  final ColorPack colorPack;
  final ButtonMode mode;
  final ButtonSize size;
  final ApiRequestState apiState;

  const IconButtonWidget({
    this.icon,
    required this.colorPack,
    required this.onPressed,
    this.mode = ButtonMode.filled,
    this.size = ButtonSize.md,
    this.apiState = ApiRequestState.initial,
    super.key,
  });

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  bool _hovered = false;
  bool _focused = false;

  bool get _isLoading => widget.apiState == ApiRequestState.loading;
  bool get _isDisabled => widget.onPressed == null && !_isLoading;

  ButtonColorState _resolveUiState() {
    if (_isLoading) return ButtonColorState.loading;
    if (_isDisabled) return ButtonColorState.disabled;
    if (_focused) return ButtonColorState.focused;
    if (_hovered) return ButtonColorState.hovered;
    return ButtonColorState.enabled;
  }

  @override
  Widget build(BuildContext context) {
    final uiState = _resolveUiState();
    final colors = ButtonColorPacks.of(widget.colorPack).resolve(widget.mode, uiState);
    final style = ButtonWidgetStyle.of(widget.size);

    return SizedBox(
      width: style.size.width,
      height: style.size.height,
      child: FocusableActionDetector(
        onShowFocusHighlight: (v) => setState(() => _focused = v),
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: ElevatedButton(
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
                : Icon(widget.icon, size: 24),

          ),
        ),
      ),
    );
  }
}

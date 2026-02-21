import 'package:flutter/material.dart';
import 'package:vamstreet_components/vamstreet_components.dart'
    show AppTypography, Dimens, RadioSize, ColorPack;

import 'core/radio_color_packs.dart';
import 'core/radio_color_state.dart';

class RadioButtonWidget<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final String text;
  final bool disabled;
  final RadioSize size;
  final ColorPack colorPack;

  const RadioButtonWidget({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
    this.disabled = false,
    this.size = RadioSize.lg,
    this.colorPack = ColorPack.brand,
    super.key,
  });

  @override
  State<RadioButtonWidget<T>> createState() => _RadioButtonWidgetState<T>();
}

class _RadioButtonWidgetState<T> extends State<RadioButtonWidget<T>> {
  bool _hovered = false;
  bool _focused = false;

  bool get _selected => widget.value == widget.groupValue;

  RadioColorState _resolveState() {
    if (widget.disabled) return RadioColorState.disabled;
    if (_focused) return RadioColorState.focused;
    if (_hovered) return RadioColorState.hovered;
    if (_selected) return RadioColorState.selected;
    return RadioColorState.enabled;
  }

  @override
  Widget build(BuildContext context) {
    final state = _resolveState();
    final colors = RadioColorPacks.brand.resolve(state);

    final circleSize = widget.size == RadioSize.lg ? 24.0 : 32.0;
    final dotSize = widget.size == RadioSize.lg ? 12.0 : 16.0;

    return Material(
      child: FocusableActionDetector(
        onShowFocusHighlight: (v) => setState(() => _focused = v),
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: GestureDetector(
            onTap: widget.disabled
                ? null
                : () => widget.onChanged?.call(widget.value),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.text,
                  style: AppTypography.textTheme.bodyMedium?.copyWith(
                    color: Color(colors.text),
                  ),
                ),
                const SizedBox(width: Dimens.px8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(colors.border), width: 2),
                  ),
                  child: _selected
                      ? Center(
                          child: Container(
                            width: dotSize,
                            height: dotSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(colors.dot),
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

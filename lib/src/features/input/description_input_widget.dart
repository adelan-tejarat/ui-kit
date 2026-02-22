import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DescriptionInputWidget extends HookWidget {
  final bool isDisabled;
  final String? labelText;
  final String? hintText;
  final String? errorText; // اگر نال نباشه، یعنی خطا داریم
  final Function(String)? onChanged;
  final String? initialValue;

  // تعداد سطرهای پیش‌فرض
  final int minLines;
  final int? maxLines;

  const DescriptionInputWidget({
    super.key,
    this.isDisabled = false,
    this.labelText,
    this.hintText,
    this.errorText, // اگر نال نباشه، خطا فعال میشه
    this.onChanged,
    this.initialValue,
    this.minLines = 4, // پیش‌فرض 4 سطر
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    // تشخیص خطا از روی errorText
    final hasError = errorText != null && errorText!.isNotEmpty;

    // ساخت controller
    final controller = useTextEditingController(text: initialValue);

    // مقداردهی اولیه اگر initialValue تغییر کرد
    useEffect(() {
      if (initialValue != null && controller.text != initialValue) {
        controller.text = initialValue!;
      }
      return null;
    }, [initialValue]);

    // پدینگ ثابت 12 پیکسل از همه طرف
    const double padding = 12.0;
    const double helperFontSize = 12.0;
    const double textFontSize = 14.0;
    const double targetLineHeight = 24.0;

    // ارتفاع کل = (padding * 2) + (targetLineHeight * minLines)
    final totalHeight = (padding * 2) + (targetLineHeight * minLines);

    // scale factor برای TextStyle.height
    final lineHeightScale = targetLineHeight / textFontSize;

    // state‌ها
    final isHovered = useState<bool>(false);
    final focusNode = useFocusNode();
    final isFocused = useState<bool>(false);

    // هندلرها
    final onFocusChange = useCallback(() {
      isFocused.value = focusNode.hasFocus;
    }, [focusNode]);

    final onEnter = useCallback((_) => isHovered.value = true, []);
    final onExit = useCallback((_) => isHovered.value = false, []);

    final onTextChanged = useCallback((String value) {
      onChanged?.call(value);
    }, [onChanged]);

    // افکت فوکوس
    useEffect(() {
      focusNode.addListener(onFocusChange);
      return () => focusNode.removeListener(onFocusChange);
    }, [focusNode, onFocusChange]);

    // کلاس کمکی رنگ
    final colorHelper = useMemoized(() => const _DescriptionColorHelper(), []);

    // decoration
    final decoration = useMemoized(
          () {
        final borderColor = colorHelper.getBorderColor(
          isDisabled: isDisabled,
          hasError: hasError,
          isFocused: isFocused.value,
          isHovered: isHovered.value,
        );

        final bgColor = colorHelper.getBackgroundColor(
          isDisabled: isDisabled,
          isHovered: isHovered.value,
          isFocused: isFocused.value,
        );

        return InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: errorText, // مستقیم استفاده میشه
          alignLabelWithHint: true,

          labelStyle: TextStyle(
            color: isDisabled ? Colors.grey.shade500 : null,
            fontSize: helperFontSize,
          ),
          hintStyle: TextStyle(
            color: isDisabled ? Colors.grey.shade400 : null,
            fontSize: helperFontSize,
          ),
          errorStyle: const TextStyle(
            fontSize: 12,
            color: Colors.red,
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),

          fillColor: bgColor,
          filled: true,

          contentPadding: const EdgeInsetsDirectional.all(padding),
        );
      },
      [
        labelText,
        hintText,
        errorText,
        isDisabled,
        hasError,
        isFocused.value,
        isHovered.value,
      ],
    );

    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      child: Container(
        height: totalHeight,
        alignment: Alignment.topLeft,
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          enabled: !isDisabled,
          onChanged: onTextChanged,
          decoration: decoration,
          style: TextStyle(
            color: isDisabled ? Colors.grey.shade600 : null,
            fontSize: textFontSize,
            height: lineHeightScale,
          ),
          minLines: minLines,
          maxLines: maxLines ?? minLines,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          expands: false,
        ),
      ),
    );
  }
}

// کلاس اختصاصی برای رنگ‌های Description
class _DescriptionColorHelper {
  const _DescriptionColorHelper();

  Color getBorderColor({
    required bool isDisabled,
    required bool hasError,
    required bool isFocused,
    required bool isHovered,
  }) {
    if (isDisabled) return Colors.grey.shade400;
    if (hasError) return Colors.red; // دیگه isError نیست، hasError شده
    if (isFocused) return Colors.yellow.shade700;
    if (isHovered) return Colors.yellow.shade700;
    return Colors.grey.shade300;
  }

  Color? getBackgroundColor({
    required bool isDisabled,
    required bool isHovered,
    required bool isFocused,
  }) {
    if (isDisabled) return Colors.grey.shade200;
    if (isHovered && !isFocused) return Colors.yellow.shade50;
    return Colors.transparent;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextInputWidget extends HookWidget {
  final bool isDisabled;
  final bool isLarge;
  final String? labelText;
  final String? hintText;
  final String? errorText; // اضافه شد - اگر نال نباشه یعنی خطا داریم
  final Function(String)? onChanged;
  final String? initialValue;

  // Prefix/Suffix
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onPrefixTap;
  final VoidCallback? onSuffixTap;

  const TextInputWidget({
    super.key,
    this.isDisabled = false,
    this.isLarge = false,
    this.labelText,
    this.hintText,
    this.errorText, // اضافه شد
    this.onChanged,
    this.initialValue,
    this.prefix,
    this.suffix,
    this.onPrefixTap,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    // تشخیص خطا از روی errorText
    final hasError = errorText != null && errorText!.isNotEmpty;

    // ساخت controller درون ویجت با useTextEditingController
    final controller = useTextEditingController(text: initialValue);

    // مقداردهی اولیه اگر initialValue تغییر کرد
    useEffect(() {
      if (initialValue != null && controller.text != initialValue) {
        controller.text = initialValue!;
      }
      return null;
    }, [initialValue]);

    // استفاده از useMemoized برای مقادیر ثابت
    final dimensions = useMemoized(
          () => _Dimensions(
        verticalPadding: isLarge ? 16.0 : 12.0,
        horizontalPadding: isLarge ? 16.0 : 12.0,
        helperFontSize: isLarge ? 14.0 : 12.0,
        textFontSize: isLarge ? 16.0 : 14.0,
        totalHeight: (isLarge ? 16.0 : 12.0) * 2 + 24.0,
      ),
      [isLarge],
    );

    // useState برای hover و focus
    final isHovered = useState<bool>(false);
    final focusNode = useFocusNode();
    final isFocused = useState<bool>(false);

    // useCallback برای هندلرها
    final onFocusChange = useCallback(() {
      isFocused.value = focusNode.hasFocus;
    }, [focusNode]);

    final onEnter = useCallback((_) => isHovered.value = true, []);
    final onExit = useCallback((_) => isHovered.value = false, []);

    final onTextChanged = useCallback((String value) {
      onChanged?.call(value);
    }, [onChanged]);

    // useEffect برای مدیریت لیسنر فوکوس
    useEffect(() {
      focusNode.addListener(onFocusChange);
      return () => focusNode.removeListener(onFocusChange);
    }, [focusNode, onFocusChange]);

    // useMemoized برای توابع محاسبه رنگ
    final colorHelper = useMemoized(() => const _ColorHelper(), []);

    // useMemoized برای prefixIcon
    final prefixIcon = useMemoized(
          () {
        if (prefix == null) return null;

        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: dimensions.horizontalPadding,
            end: 8,
          ),
          child: GestureDetector(
            onTap: isDisabled ? null : onPrefixTap,
            behavior: HitTestBehavior.opaque,
            child: IconTheme(
              data: IconThemeData(
                color: colorHelper.getIconColor(isDisabled, hasError), // hasError جایگزین isError
                size: 24,
              ),
              child: prefix!,
            ),
          ),
        );
      },
      [prefix, isDisabled, hasError, onPrefixTap, dimensions.horizontalPadding], // hasError جایگزین isError
    );

    // useMemoized برای suffixIcon
    final suffixIcon = useMemoized(
          () {
        if (suffix == null) return null;

        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: 8,
            end: dimensions.horizontalPadding,
          ),
          child: GestureDetector(
            onTap: isDisabled ? null : onSuffixTap,
            behavior: HitTestBehavior.opaque,
            child: IconTheme(
              data: IconThemeData(
                color: colorHelper.getIconColor(isDisabled, hasError), // hasError جایگزین isError
                size: 24,
              ),
              child: suffix!,
            ),
          ),
        );
      },
      [suffix, isDisabled, hasError, onSuffixTap, dimensions.horizontalPadding], // hasError جایگزین isError
    );

    // useMemoized برای decoration
    final decoration = useMemoized(
          () {
        final borderColor = colorHelper.getBorderColor(
          isDisabled: isDisabled,
          hasError: hasError, // hasError جایگزین isError
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

          labelStyle: TextStyle(
            color: isDisabled ? Colors.grey.shade500 : null,
            fontSize: dimensions.helperFontSize,
          ),
          hintStyle: TextStyle(
            color: isDisabled ? Colors.grey.shade400 : null,
            fontSize: dimensions.helperFontSize,
          ),
          errorStyle: const TextStyle(
            fontSize: 12,
            color: Colors.red,
          ),

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

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

          contentPadding: EdgeInsetsDirectional.only(
            top: dimensions.verticalPadding,
            bottom: dimensions.verticalPadding,
            start: prefix == null ? dimensions.horizontalPadding : 0,
            end: suffix == null ? dimensions.horizontalPadding : 0,
          ),
        );
      },
      [
        labelText,
        hintText,
        errorText,
        isDisabled,
        hasError, // hasError جایگزین isError
        isFocused.value,
        isHovered.value,
        prefix,
        suffix,
        prefixIcon,
        suffixIcon,
        dimensions,
      ],
    );

    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      child: Container(
        height: dimensions.totalHeight,
        alignment: Alignment.centerLeft,
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          enabled: !isDisabled,
          onChanged: onTextChanged,
          decoration: decoration,
          style: TextStyle(
            color: isDisabled ? Colors.grey.shade600 : null,
            fontSize: dimensions.textFontSize,
          ),
        ),
      ),
    );
  }
}

// کلاس کمکی برای ابعاد
class _Dimensions {
  final double verticalPadding;
  final double horizontalPadding;
  final double helperFontSize;
  final double textFontSize;
  final double totalHeight;

  const _Dimensions({
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.helperFontSize,
    required this.textFontSize,
    required this.totalHeight,
  });
}

// کلاس کمکی برای رنگ‌ها
class _ColorHelper {
  const _ColorHelper();

  Color getBorderColor({
    required bool isDisabled,
    required bool hasError, // تغییر نام از isError به hasError
    required bool isFocused,
    required bool isHovered,
  }) {
    if (isDisabled) return Colors.grey.shade400;
    if (hasError) return Colors.red;
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

  Color getIconColor(bool isDisabled, bool hasError) { // تغییر نام
    if (isDisabled) return Colors.grey.shade400;
    if (hasError) return Colors.red;
    return Colors.grey.shade600;
  }
}

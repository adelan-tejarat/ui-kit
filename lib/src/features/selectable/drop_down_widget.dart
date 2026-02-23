// lib/src/features/selectbox/selectbox_widget.dart

import 'package:flutter/material.dart';
import 'package:search_autocomplete/search_autocomplete.dart';
import 'package:vamstreet_uikit/vamstreet_uikit.dart';

class SelectOption<T> {
  final T value;
  final String label;
  final Widget? leadingIcon;

  const SelectOption({
    required this.value,
    required this.label,
    this.leadingIcon,
  });
}

class SelectBox<T> extends StatefulWidget {
  final T? value;
  final List<SelectOption<T>> options;
  final ValueChanged<T?>? onChanged;

  final bool isDisabled;
  final bool isLarge;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final double? dropdownMaxHeight;

  // Prefix/Suffix
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onPrefixTap;
  final VoidCallback? onSuffixTap;

  const SelectBox({
    super.key,
    required this.options,
    this.value,
    this.onChanged,
    this.isDisabled = false,
    this.isLarge = false,
    this.labelText,
    this.hintText,
    this.errorText,
    this.dropdownMaxHeight = 300,
    this.prefix,
    this.suffix,
    this.onPrefixTap,
    this.onSuffixTap,
  });

  @override
  State<SelectBox<T>> createState() => _SelectBoxState<T>();
}

class _SelectBoxState<T> extends State<SelectBox<T>> {
  // لیست فیلتر شده
  late List<SelectOption<T>> _filteredOptions;

  // State برای هاور
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _filteredOptions = widget.options;
  }

  @override
  void didUpdateWidget(SelectBox<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.options != widget.options) {
      _filteredOptions = widget.options;
    }
  }

  // پیدا کردن گزینه انتخاب شده
  SelectOption<T>? get _selectedOption {
    if (widget.value == null) return null;
    try {
      return widget.options.firstWhere((e) => e.value == widget.value);
    } catch (e) {
      return null;
    }
  }

  void _handleSearch(String query) {
    setState(() {
      _filteredOptions = widget.options
          .where((option) =>
          option.label.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _handleSelected(SelectOption<T> option) {
    widget.onChanged?.call(option.value);
  }

  @override
  Widget build(BuildContext context) {
    // محاسبه ابعاد مثل TextInputWidget
    final verticalPadding = widget.isLarge ? 16.0 : 12.0;
    final horizontalPadding = widget.isLarge ? 16.0 : 12.0;
    final helperFontSize = widget.isLarge ? 14.0 : 12.0;
    final textFontSize = widget.isLarge ? 16.0 : 14.0;

    // رنگ‌بندی مثل TextInputWidget با اضافه کردن isHovered
    Color getBorderColor(Set<MaterialState> states) {
      if (widget.isDisabled) return Colors.grey.shade400;
      if (widget.errorText != null) return Colors.red;
      if (states.contains(MaterialState.focused)) return Colors.yellow.shade700;
      if (_isHovered) return Colors.yellow.shade700;
      return Colors.grey.shade300;
    }

    Color? getBackgroundColor(Set<MaterialState> states) {
      if (widget.isDisabled) return Colors.grey.shade200;
      if (_isHovered && !states.contains(MaterialState.focused)) {
        return Colors.yellow.shade50;
      }
      return Colors.transparent;
    }

    Color getIconColor() {
      if (widget.isDisabled) return Colors.grey.shade400;
      if (widget.errorText != null) return Colors.red;
      if (_isHovered) return Colors.yellow.shade700;
      return Colors.grey.shade600;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: SearchAutocomplete<SelectOption<T>>(
        options: _filteredOptions,
        initValue: _selectedOption,
        getString: (option) => option.label,

        onSearch: _handleSearch,
        onSelected: _handleSelected,

        hintText: widget.hintText ?? 'جستجو...',

        fieldBuilder: (controller, onFieldTap, showDropdown, onPressed) {
          return TextFormField(
            controller: controller,
            onTap: onFieldTap,
            enabled: !widget.isDisabled,
            readOnly: widget.isDisabled,
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              errorText: widget.errorText,

              labelStyle: TextStyle(
                fontSize: helperFontSize,
                color: widget.isDisabled ? Colors.grey.shade500 : null,
              ),
              hintStyle: TextStyle(
                fontSize: helperFontSize,
                color: widget.isDisabled ? Colors.grey.shade400 : null,
              ),
              errorStyle: const TextStyle(fontSize: 12, color: Colors.red),

              // Prefix
              prefixIcon: widget.prefix != null
                  ? Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: GestureDetector(
                  onTap: widget.isDisabled ? null : widget.onPrefixTap,
                  child: IconTheme(
                    data: IconThemeData(color: getIconColor(), size: 24),
                    child: widget.prefix!,
                  ),
                ),
              )
                  : null,

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getBorderColor({}),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getBorderColor({MaterialState.focused}),
                  width: 2,
                ),
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

              contentPadding: EdgeInsetsDirectional.only(
                top: verticalPadding,
                bottom: verticalPadding,
                start: widget.prefix == null ? horizontalPadding : 0,
                end: 0,
              ),

              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.suffix != null)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 4),
                      child: GestureDetector(
                        onTap: widget.isDisabled ? null : widget.onSuffixTap,
                        child: IconTheme(
                          data: IconThemeData(color: getIconColor(), size: 24),
                          child: widget.suffix!,
                        ),
                      ),
                    ),
                  IconButton(
                    icon: Icon(
                      showDropdown ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: getIconColor(),
                    ),
                    onPressed: widget.isDisabled ? null : () => onPressed(showDropdown),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  SizedBox(width: widget.suffix == null ? horizontalPadding : 4),
                ],
              ),
            ),
            style: TextStyle(
              color: widget.isDisabled ? Colors.grey.shade600 : null,
              fontSize: textFontSize,
            ),
          );
        },

        dropDownBuilder: (options, onSelected, controller) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: widget.dropdownMaxHeight ?? 300,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                final isSelected = option.value == widget.value;

                return InkWell(
                  onTap: () => onSelected(option),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    color: isSelected ? Colors.yellow.shade50 : null,
                    child: Row(
                      children: [
                        if (option.leadingIcon != null) ...[
                          option.leadingIcon!,
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Text(
                            option.label,
                            style: TextStyle(
                              fontSize: textFontSize,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check,
                            size: 18,
                            color: Colors.yellow,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },

        emptyDropDown: (controller, close) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'موردی یافت نشد',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

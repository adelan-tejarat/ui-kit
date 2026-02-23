import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/vamstreet_uikit.dart'
    show
        Dimens,
        AppColors,
        AppRadius,
        AppTypography,
        ColorPack,
        RadioSize,
        RadioButtonWidget;

class RadioButtonsPage extends StatefulWidget {
  const RadioButtonsPage({super.key});

  @override
  State<RadioButtonsPage> createState() => _RadioButtonsPageState();
}

class _RadioButtonsPageState extends State<RadioButtonsPage> {
  bool _showHoverStates = false;
  String? _groupValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Button Showcase'),
        backgroundColor: const Color(AppColors.neutral50),
        elevation: Dimens.px0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(Dimens.px8),
            child: InkWell(
              onTap: () {
                setState(() {
                  _showHoverStates = !_showHoverStates;
                });
              },
              borderRadius: AppRadius.lgAll,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.px12,
                  vertical: Dimens.px8,
                ),
                decoration: BoxDecoration(
                  color: _showHoverStates
                      ? const Color(AppColors.brand500)
                      : const Color(AppColors.neutral200),
                  borderRadius: AppRadius.lgAll,
                ),
                child: Text(
                  'Show Hover: ${_showHoverStates ? 'ON' : 'OFF'}',
                  style: AppTypography.textTheme.labelMedium?.copyWith(
                    color: _showHoverStates
                        ? const Color(AppColors.white)
                        : const Color(AppColors.neutral700),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.px16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: Dimens.px32),

            for (final size in RadioSize.values) ...[
              _buildSizeHeader(size),
              const SizedBox(height: Dimens.px16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildRadioTable(size),
              ),
              const SizedBox(height: Dimens.px32),
            ],
          ],
        ),
      ),
    );
  }

  // ======================================================
  // HEADER
  // ======================================================

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(AppColors.brand500), Color(AppColors.violet600)],
        ),
        borderRadius: AppRadius.lgAll,
      ),
      child: Text(
        'Radio Button Showcase\n'
        '• ${RadioSize.values.length} sizes (${RadioSize.values.map((e) => e.name).join(', ')})\n'
        '• ${ColorPack.values.length} color packs (${ColorPack.values.map((e) => e.name).join(', ')})\n'
        '• States: Enabled, Disabled, Selected, Hover',
        style: AppTypography.textTheme.bodyLarge?.copyWith(
          color: const Color(AppColors.white),
        ),
      ),
    );
  }

  // ======================================================
  // SIZE HEADER
  // ======================================================

  Widget _buildSizeHeader(RadioSize size) {
    final label = size == RadioSize.lg ? 'Large (lg)' : 'Extra Large (xlg)';

    return Container(
      padding: const EdgeInsets.all(Dimens.px12),
      decoration: BoxDecoration(
        color: const Color(AppColors.neutral100),
        borderRadius: AppRadius.mdAll,
        border: Border.all(color: const Color(AppColors.neutral300)),
      ),
      child: Text(label, style: AppTypography.textTheme.titleMedium),
    );
  }

  // ======================================================
  // TABLE
  // ======================================================

  Widget _buildRadioTable(RadioSize size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final pack in ColorPack.values) ...[
          Row(
            children: [
              SizedBox(
                width: Dimens.px112,
                child: Text(
                  pack.name.toUpperCase(),
                  style: AppTypography.textTheme.labelMedium,
                ),
              ),
              const SizedBox(width: Dimens.px16),

              // Enabled
              _buildRadio(size, pack, false, false),
              const SizedBox(width: Dimens.px24),

              // Selected
              _buildRadio(size, pack, true, false),
              const SizedBox(width: Dimens.px24),

              // Disabled
              _buildRadio(size, pack, false, true),
              const SizedBox(width: Dimens.px24),

              if (_showHoverStates)
                _buildRadio(size, pack, false, false, hover: true),
            ],
          ),
          const SizedBox(height: Dimens.px24),
        ],
      ],
    );
  }

  Widget _buildRadio(
    RadioSize size,
    ColorPack pack,
    bool selected,
    bool disabled, {
    bool hover = false,
  }) {
    final value = "${pack.name}_${selected}_${disabled}_${hover}";

    return RadioButtonWidget<String>(
      value: value,
      groupValue: selected ? value : _groupValue,
      text: "متن",
      size: size,
      disabled: disabled,
      colorPack: pack,
      onChanged: disabled
          ? null
          : (val) {
              setState(() {
                _groupValue = val;
              });
            },
    );
  }
}

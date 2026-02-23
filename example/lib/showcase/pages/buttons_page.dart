import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/vamstreet_uikit.dart'
    show
    Dimens,
    AppColors,
    AppRadius,
    AppTypography,
    ButtonWidget,
    IconButtonWidget,
    ButtonMode,
    ColorPack,
    ApiRequestState,
    ButtonSize;

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  bool _showHoverStates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Showcase - Complete'),
        backgroundColor: const Color(AppColors.neutral50),
        elevation: Dimens.px0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(Dimens.px8),
            child: Material(
              color: Colors.transparent,
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

            // ======================================================
            // BUTTON WIDGET (متنی)
            // ======================================================
            _buildSectionTitle('BUTTON WIDGET (Text Button)'),
            const SizedBox(height: Dimens.px16),

            for (final size in ButtonSize.values) ...[
              _buildSizeHeader(size),
              const SizedBox(height: Dimens.px12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildButtonTable(size),
              ),
              const SizedBox(height: Dimens.px24),
            ],

            const Divider(height: Dimens.px32),

            // ======================================================
            // ICON BUTTON WIDGET (آیکونی)
            // ======================================================
            _buildSectionTitle('ICON BUTTON WIDGET (Icon Button)'),
            const SizedBox(height: Dimens.px16),

            for (final size in ButtonSize.values) ...[
              _buildSizeHeader(size),
              const SizedBox(height: Dimens.px12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildIconButtonTable(size),
              ),
              const SizedBox(height: Dimens.px24),
            ],

            const SizedBox(height: Dimens.px32),
            _buildLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(AppColors.brand500),
            Color(AppColors.violet600),
          ],
        ),
        borderRadius: AppRadius.lgAll,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Complete Button Showcase',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
              color: const Color(AppColors.white),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'All possible button states, sizes, modes, and color packs.\n'
                '• ${ButtonSize.values.length} sizes (${ButtonSize.values.map((e) => e.name).join(', ')})\n'
                '• ${ButtonMode.values.length} modes (${ButtonMode.values.map((e) => e.name).join(', ')})\n'
                '• ${ColorPack.values.length} color packs (${ColorPack.values.map((e) => e.name).join(', ')})\n'
                '• 4 states (Enabled, Disabled, Loading, Hover)',
            style: AppTypography.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Dimens.px12),
      decoration: BoxDecoration(
        color: const Color(AppColors.neutral100),
        borderRadius: AppRadius.mdAll,
        border: Border.all(color: const Color(AppColors.neutral300)),
      ),
      child: Text(
        title,
        style: AppTypography.textTheme.titleLarge?.copyWith(
          color: const Color(AppColors.neutral900),
        ),
      ),
    );
  }

  Widget _buildSizeHeader(ButtonSize size) {
    String sizeText = '';
    Color color = const Color(AppColors.neutral700);

    switch (size) {
      case ButtonSize.md:
        sizeText = 'Medium (40px)';
        color = const Color(AppColors.sky600);
        break;
      case ButtonSize.lg:
        sizeText = 'Large (48px)';
        color = const Color(AppColors.violet600);
        break;
      case ButtonSize.xlg:
        sizeText = 'Extra Large (56px)';
        color = const Color(AppColors.brand600);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.px12,
        vertical: Dimens.px8,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.mdAll,
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.height,
            size: Dimens.px20,
            color: color,
          ),
          const SizedBox(width: Dimens.px8),
          Text(
            sizeText,
            style: AppTypography.textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonTable(ButtonSize size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header ردیف‌ها - اصلاح شده
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // فضای خالی برای هماهنگی با برچسب‌های ردیف
              const SizedBox(width: Dimens.px80 + Dimens.px8),

              // هدرهای Mode
              for (final mode in ButtonMode.values) ...[
                _buildModeHeader(mode, size),
                if (mode != ButtonMode.values.last)
                  const SizedBox(width: Dimens.px16),
              ],
            ],
          ),
        ),
        const SizedBox(height: Dimens.px8),

        for (final colorPack in ColorPack.values) ...[
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimens.px80,
                  child: _buildColorPackLabel(colorPack),
                ),
                const SizedBox(width: Dimens.px8),

                for (final mode in ButtonMode.values) ...[
                  _buildButtonColumn(size, mode, colorPack),
                  if (mode != ButtonMode.values.last)
                    const SizedBox(width: Dimens.px16),
                ],
              ],
            ),
          ),
          const SizedBox(height: Dimens.px20),
        ],
      ],
    );
  }

  Widget _buildIconButtonTable(ButtonSize size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: Dimens.px80 + Dimens.px8),
              for (final mode in ButtonMode.values) ...[
                _buildModeHeader(mode, size),
                if (mode != ButtonMode.values.last)
                  const SizedBox(width: Dimens.px16),
              ],
            ],
          ),
        ),
        const SizedBox(height: Dimens.px8),

        for (final colorPack in ColorPack.values) ...[
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimens.px80,
                  child: _buildColorPackLabel(colorPack),
                ),
                const SizedBox(width: Dimens.px8),

                for (final mode in ButtonMode.values) ...[
                  _buildIconButtonColumn(size, mode, colorPack),
                  if (mode != ButtonMode.values.last)
                    const SizedBox(width: Dimens.px16),
                ],
              ],
            ),
          ),
          const SizedBox(height: Dimens.px20),
        ],
      ],
    );
  }

  Widget _buildModeHeader(ButtonMode mode, ButtonSize size) {
    Color color;
    String label;

    switch (mode) {
      case ButtonMode.filled:
        color = const Color(AppColors.green600);
        label = 'FILLED';
        break;
      case ButtonMode.outline:
        color = const Color(AppColors.pink600);
        label = 'OUTLINE';
        break;
      case ButtonMode.standard:
        color = const Color(AppColors.amber700);
        label = 'STANDARD';
        break;
    }

    // محاسبه عرض بر اساس سایز دکمه
    double buttonWidth;
    switch (size) {
      case ButtonSize.md:
        buttonWidth = 107; // ButtonStyles.md.width
        break;
      case ButtonSize.lg:
        buttonWidth = 107; // ButtonStyles.lg.width
        break;
      case ButtonSize.xlg:
        buttonWidth = 107; // ButtonStyles.xlg.width
        break;
    }

    return SizedBox(
      width: buttonWidth,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.px4,
            horizontal: Dimens.px12,
          ),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: AppRadius.fullAll,
          ),
          child: Text(
            label,
            style: AppTypography.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorPackLabel(ColorPack pack) {
    Color color;
    String name;

    switch (pack) {
      case ColorPack.brand:
        color = const Color(AppColors.brand600);
        name = 'BRAND';
        break;
      case ColorPack.green:
        color = const Color(AppColors.green600);
        name = 'GREEN';
        break;
      case ColorPack.red:
        color = const Color(AppColors.red600);
        name = 'RED';
        break;
      case ColorPack.neutral:
        color = const Color(AppColors.neutral600);
        name = 'NEUTRAL';
        break;
    }

    return Container(
      height: Dimens.px160,
      padding: const EdgeInsets.all(Dimens.px8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: AppRadius.mdAll,
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Center(
        child: Transform.rotate(
          angle: -1.57,
          child: Text(
            name,
            style: AppTypography.textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonColumn(
      ButtonSize size,
      ButtonMode mode,
      ColorPack colorPack,
      ) {
    return Column(
      children: [
        ButtonWidget(
          text: 'فعال',
          colorPack: colorPack,
          mode: mode,
          size: size,
          onPressed: () {},
        ),
        const SizedBox(height: Dimens.px8),

        ButtonWidget(
          text: 'غیرفعال',
          colorPack: colorPack,
          mode: mode,
          size: size,
          onPressed: null,
        ),
        const SizedBox(height: Dimens.px8),

        ButtonWidget(
          text: 'در حال بارگذاری',
          colorPack: colorPack,
          mode: mode,
          size: size,
          apiState: ApiRequestState.loading,
          onPressed: () {},
        ),
        const SizedBox(height: Dimens.px8),

        if (_showHoverStates) ...[
          MouseRegion(
            child: ButtonWidget(
              text: 'هاور',
              colorPack: colorPack,
              mode: mode,
              size: size,
              onPressed: () {},
            ),
          ),
          const SizedBox(height: Dimens.px8),
        ],
      ],
    );
  }

  Widget _buildIconButtonColumn(
      ButtonSize size,
      ButtonMode mode,
      ColorPack colorPack,
      ) {
    return Column(
      children: [
        IconButtonWidget(
          icon: Icons.favorite,
          colorPack: colorPack,
          mode: mode,
          size: size,
          onPressed: () {},
        ),
        const SizedBox(height: Dimens.px8),

        IconButtonWidget(
          icon: Icons.favorite_border,
          colorPack: colorPack,
          mode: mode,
          size: size,
          onPressed: null,
        ),
        const SizedBox(height: Dimens.px8),

        IconButtonWidget(
          icon: Icons.favorite,
          colorPack: colorPack,
          mode: mode,
          size: size,
          apiState: ApiRequestState.loading,
          onPressed: () {},
        ),
        const SizedBox(height: Dimens.px8),

        if (_showHoverStates) ...[
          MouseRegion(
            child: IconButtonWidget(
              icon: Icons.favorite,
              colorPack: colorPack,
              mode: mode,
              size: size,
              onPressed: () {},
            ),
          ),
          const SizedBox(height: Dimens.px8),
        ],
      ],
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.neutral100),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral300)),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📋 راهنما:',
              style: AppTypography.textTheme.titleMedium?.copyWith(
                color: const Color(AppColors.neutral900),
              ),
            ),
            const SizedBox(height: Dimens.px12),
            Wrap(
              spacing: Dimens.px24,
              runSpacing: Dimens.px12,
              children: [
                _buildLegendItem('فعال', Icons.circle, const Color(AppColors.green500)),
                _buildLegendItem('غیرفعال', Icons.circle, const Color(AppColors.neutral400)),
                _buildLegendItem('در حال بارگذاری', Icons.hourglass_empty, const Color(AppColors.amber600)),
                _buildLegendItem('هاور', Icons.mouse, const Color(AppColors.violet500)),
              ],
            ),
            const SizedBox(height: Dimens.px12),
            Text(
              '• هر ستون یک Mode را نشان می‌دهد (Filled, Outline, Standard)',
              style: AppTypography.textTheme.bodySmall,
            ),
            Text(
              '• هر ردیف یک ColorPack را نشان می‌دهد (Brand, Green, Red, Neutral)',
              style: AppTypography.textTheme.bodySmall,
            ),
            Text(
              '• هر بلوک ۴ حالت مختلف را نمایش می‌دهد',
              style: AppTypography.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, IconData icon, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: Dimens.px16, color: color),
        const SizedBox(width: Dimens.px4),
        Text(
          label,
          style: AppTypography.textTheme.labelMedium?.copyWith(
            color: const Color(AppColors.neutral700),
          ),
        ),
      ],
    );
  }
}
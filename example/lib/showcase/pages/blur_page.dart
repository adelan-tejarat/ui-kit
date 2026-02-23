 import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/src/core/constants/app_blur.dart';
import 'package:vamstreet_uikit/src/core/constants/dimens.dart';
import 'package:vamstreet_uikit/src/core/themes/app_colors.dart';
import 'package:vamstreet_uikit/src/core/themes/radius.dart';
import 'package:vamstreet_uikit/src/core/themes/typography.dart';

class BlurPage extends StatelessWidget {
  const BlurPage({super.key});

  // استفاده از یک عکس ثابت برای همه کارت‌ها
  static const String _baseImageUrl =
      'https://picsum.photos/id/100/300/300'; // عکس ثابت با id مشخص

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blur Showcase'),
        backgroundColor: const Color(AppColors.neutral50),
        elevation: Dimens.px0,
        centerTitle: true, // وسط‌چین کردن عنوان
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.px16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: Dimens.px32),
            _buildBlurGrid(context),
            const SizedBox(height: Dimens.px40),
            _buildRealWorldExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(AppColors.violet50),Color( AppColors.sky50)],
        ),
        borderRadius: AppRadius.lgAll,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Blur Effects',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
              color: const Color(AppColors.neutral900),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'A complete showcase of blur values from none to 3xl. '
            'All cards use the same background image for accurate comparison.',
            style: AppTypography.textTheme.bodyLarge?.copyWith(
              color: const Color(AppColors.neutral700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurGrid(context) {
    final blurItems = [
      _BlurItemModel(label: 'None (0px)', value: AppBlur.none),
      _BlurItemModel(label: 'XS (4px)', value: AppBlur.xs),
      _BlurItemModel(label: 'SM (8px)', value: AppBlur.sm),
      _BlurItemModel(label: 'MD (12px)', value: AppBlur.md),
      _BlurItemModel(label: 'LG (16px)', value: AppBlur.lg),
      _BlurItemModel(label: 'XL (20px)', value: AppBlur.xl),
      _BlurItemModel(label: '2XL (24px)', value: AppBlur.xl2),
      _BlurItemModel(label: '3XL (32px)', value: AppBlur.xl3),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int getCrossAxisCount(double width) {
          if (width < 400) return 2;
          if (width < 600) return 3;
          if (width < 900) return 4;
          return 4;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(
              MediaQuery.of(context).size.width,
            ),
            crossAxisSpacing: Dimens.px16,
            mainAxisSpacing: Dimens.px16,
            childAspectRatio: 0.85,
          ),
          itemCount: blurItems.length,
          itemBuilder: (context, index) {
            return _BlurCard(item: blurItems[index]);
          },
        );
      },
    );
  }

  Widget _buildRealWorldExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Real World Examples',
          style: AppTypography.textTheme.headlineSmall?.copyWith(
            color: const Color(AppColors.neutral900),
          ),
        ),
        const SizedBox(height: Dimens.px20),

        // Glassmorphism Cards
        Container(
          padding: const EdgeInsets.all(Dimens.px20),
          decoration: BoxDecoration(
            color: const Color(AppColors.neutral50),
            borderRadius: AppRadius.lgAll,
            border: Border.all(color: const Color(AppColors.neutral200)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Glassmorphism Effect',
                style: AppTypography.textTheme.titleMedium?.copyWith(
                  color: const Color(AppColors.neutral800),
                ),
              ),
              const SizedBox(height: Dimens.px16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildGlassCard(
                      label: 'Light Blur',
                      blurValue: AppBlur.sm,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    const SizedBox(width: Dimens.px16),
                    _buildGlassCard(
                      label: 'Medium Blur',
                      blurValue: AppBlur.md,
                      color: Colors.white.withOpacity(0.4),
                    ),
                    const SizedBox(width: Dimens.px16),
                    _buildGlassCard(
                      label: 'Heavy Blur',
                      blurValue: AppBlur.xl,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: Dimens.px24),

        // Background Blur Examples
        Container(
          padding: const EdgeInsets.all(Dimens.px20),
          decoration: BoxDecoration(
            color: const Color(AppColors.neutral50),
            borderRadius: AppRadius.lgAll,
            border: Border.all(color: const Color(AppColors.neutral200)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Background Blur',
                style: AppTypography.textTheme.titleMedium?.copyWith(
                  color: const Color(AppColors.neutral800),
                ),
              ),
              const SizedBox(height: Dimens.px16),
              Wrap(
                spacing: Dimens.px16,
                runSpacing: Dimens.px16,
                children: [
                  _buildBackgroundBlurExample(
                    label: 'Modal Backdrop',
                    blurValue: AppBlur.md,
                  ),
                  _buildBackgroundBlurExample(
                    label: 'Settings Panel',
                    blurValue: AppBlur.lg,
                  ),
                  _buildBackgroundBlurExample(
                    label: 'Notification',
                    blurValue: AppBlur.sm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGlassCard({
    required String label,
    required double blurValue,
    required Color color,
  }) {
    return Container(
      width: Dimens.px144,
      height: Dimens.px160,
      decoration: const BoxDecoration(
        borderRadius: AppRadius.lgAll,
        image: DecorationImage(
          image: NetworkImage(_baseImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: AppRadius.lgAll,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: AppRadius.lgAll,
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.blur_circular,
                    size: Dimens.px40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: Dimens.px8),
                  Text(
                    label,
                    style: AppTypography.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: Dimens.px4),
                  Text(
                    '${blurValue.toInt()}px',
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundBlurExample({
    required String label,
    required double blurValue,
  }) {
    return Container(
      width: Dimens.px160,
      height: Dimens.px128,
      decoration: const BoxDecoration(
        borderRadius: AppRadius.lgAll,
        image: DecorationImage(
          image: NetworkImage(_baseImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: AppRadius.lgAll,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.blur_on,
                    color: Colors.white,
                    size: Dimens.px32,
                  ),
                  const SizedBox(height: Dimens.px4),
                  Text(
                    label,
                    style: AppTypography.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${blurValue.toInt()}px',
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BlurItemModel {
  final String label;
  final double value;

  _BlurItemModel({required this.label, required this.value});
}

class _BlurCard extends StatelessWidget {
  final _BlurItemModel item;

  const _BlurCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
        boxShadow: [
          BoxShadow(
            color: const Color(AppColors.neutral200).withOpacity(0.5),
            blurRadius: Dimens.px4,
            offset: const Offset(0, Dimens.px2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.px8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Blur preview section
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: AppRadius.lgAll,
                child: Stack(
                  children: [
                    // Background image - استفاده از عکس ثابت
                    Positioned.fill(
                      child: Image.network(
                        BlurPage._baseImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Blur overlay
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: item.value,
                          sigmaY: item.value,
                        ),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                    // Foreground icon
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.blur_circular,
                          size: Dimens.px32,
                          color: Color(AppColors.neutral800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Info section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(Dimens.px12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.label,
                      style: AppTypography.textTheme.titleSmall?.copyWith(
                        color: const Color(AppColors.neutral800),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Dimens.px8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.px8,
                        vertical: Dimens.px4,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(AppColors.neutral100),
                        borderRadius: AppRadius.fullAll,
                      ),
                      child: Text(
                        item.value == 0
                            ? 'No Blur'
                            : 'σ = ${item.value.toInt()}px',
                        style: AppTypography.textTheme.labelSmall?.copyWith(
                          color: const Color(AppColors.neutral600),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

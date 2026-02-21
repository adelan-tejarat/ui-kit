import 'package:flutter/material.dart';
import 'package:vamstreet_components/vamstreet_components.dart'
    show AppTypography, AppRadius, AppColors, AppOpacity, Dimens;

class OpacityPage extends StatelessWidget {
  const OpacityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity Showcase'),
        backgroundColor: const Color(AppColors.neutral50),
        elevation: Dimens.px0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.px16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: Dimens.px24),
            _buildOpacityGrid(),
            const SizedBox(height: Dimens.px32),
            _buildUsageExamples(),
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
          colors: [Color(AppColors.violet50), Color(AppColors.pink50)],
        ),
        borderRadius: AppRadius.lgAll,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opacity Values',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
              color: const Color(AppColors.neutral900),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'Complete opacity scale from 0% to 100%',
            style: AppTypography.textTheme.bodyLarge?.copyWith(
              color: const Color(AppColors.neutral700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpacityGrid() {
    final opacities = [
      _OpacityModel('0%', AppOpacity.opacity0),
      _OpacityModel('10%', AppOpacity.opacity10),
      _OpacityModel('20%', AppOpacity.opacity20),
      _OpacityModel('30%', AppOpacity.opacity30),
      _OpacityModel('40%', AppOpacity.opacity40),
      _OpacityModel('50%', AppOpacity.opacity50),
      _OpacityModel('60%', AppOpacity.opacity60),
      _OpacityModel('70%', AppOpacity.opacity70),
      _OpacityModel('80%', AppOpacity.opacity80),
      _OpacityModel('90%', AppOpacity.opacity90),
      _OpacityModel('100%', AppOpacity.opacity100),
    ];

    return Wrap(
      spacing: Dimens.px12,
      runSpacing: Dimens.px12,
      children: opacities
          .map((opacity) => _OpacityCard(model: opacity))
          .toList(),
    );
  }

  Widget _buildUsageExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Usage Examples',
          style: AppTypography.textTheme.headlineSmall?.copyWith(
            color: const Color(AppColors.neutral900),
          ),
        ),
        const SizedBox(height: Dimens.px20),
        Container(
          padding: const EdgeInsets.all(Dimens.px20),
          decoration: BoxDecoration(
            color: const Color(AppColors.white),
            borderRadius: AppRadius.lgAll,
            border: Border.all(color: const Color(AppColors.neutral200)),
          ),
          child: Column(
            children: [
              _buildDisabledExample(),
              const SizedBox(height: Dimens.px24),
              _buildHoverExample(),
              const SizedBox(height: Dimens.px24),
              _buildLoadingExample(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDisabledExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Disabled State', style: AppTypography.textTheme.titleMedium),
        const SizedBox(height: Dimens.px12),
        Row(
          children: [
            _buildDemoButton('Enabled', false),
            const SizedBox(width: Dimens.px12),
            _buildDemoButton('Disabled', true),
          ],
        ),
      ],
    );
  }

  Widget _buildHoverExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hover Effect', style: AppTypography.textTheme.titleMedium),
        const SizedBox(height: Dimens.px12),
        MouseRegion(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.px16,
              vertical: Dimens.px8,
            ),
            decoration: const BoxDecoration(
              color: Color(AppColors.brand500),
              borderRadius: AppRadius.mdAll,
            ),
            child: Text(
              'Hover me!',
              style: AppTypography.textTheme.labelLarge?.copyWith(
                color: const Color(AppColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Loading State', style: AppTypography.textTheme.titleMedium),
        const SizedBox(height: Dimens.px12),
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: AppOpacity.opacity50,
              child: _buildDemoButton('Loading...', false),
            ),
            const SizedBox(
              width: Dimens.px20,
              height: Dimens.px20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  const Color(AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDemoButton(String label, bool disabled) {
    return Opacity(
      opacity: disabled ? AppOpacity.opacity50 : AppOpacity.opacity100,
      child: AbsorbPointer(
        absorbing: disabled,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.px16,
            vertical: Dimens.px8,
          ),
          decoration: BoxDecoration(
            color: const Color(AppColors.brand500),
            borderRadius: AppRadius.mdAll,
          ),
          child: Text(
            label,
            style: AppTypography.textTheme.labelLarge?.copyWith(
              color: const Color(AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _OpacityModel {
  final String label;
  final double value;

  _OpacityModel(this.label, this.value);
}

class _OpacityCard extends StatelessWidget {
  final _OpacityModel model;

  const _OpacityCard({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.px96,
      padding: const EdgeInsets.all(Dimens.px12),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        children: [
          Container(
            width: Dimens.px48,
            height: Dimens.px48,
            decoration: BoxDecoration(
              color: const Color(AppColors.brand500).withOpacity(model.value),
              borderRadius: AppRadius.mdAll,
              border: Border.all(color: const Color(AppColors.brand200)),
            ),
            child: Center(
              child: Text(
                model.label,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: model.value > 0.5
                      ? const Color(AppColors.white)
                      : const Color(AppColors.neutral900),
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(model.label, style: AppTypography.textTheme.labelMedium),
        ],
      ),
    );
  }
}

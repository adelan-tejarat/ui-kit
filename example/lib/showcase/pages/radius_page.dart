import 'package:flutter/material.dart';
import 'package:vamstreet_components/src/core/themes/radius.dart';
import 'package:vamstreet_components/src/core/constants/dimens.dart';
import 'package:vamstreet_components/src/core/themes/app_colors.dart';

class RadiusPage extends StatelessWidget {
  const RadiusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Border Radius Showcase'),
        backgroundColor: AppColors.neutral50,
        elevation: Dimens.px0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.px16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: Dimens.px24),
            _buildRadiusGrid(context),
            const SizedBox(height: Dimens.px32),
            _buildUsageExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: AppColors.neutral200),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Border Radius Scale',
            style: TextStyle(
              fontSize: Dimens.px24,
              fontWeight: FontWeight.w700,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: Dimens.px8),
          Text(
            'A comprehensive showcase of all border radius values available in the design system.',
            style: TextStyle(
              fontSize: Dimens.px14,
              color: AppColors.neutral600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadiusGrid(context) {
    final radiusItems = [
      _RadiusItemModel(label: 'rounded-none', value: AppRadius.none),
      _RadiusItemModel(label: 'rounded-xs', value: AppRadius.xs),
      _RadiusItemModel(label: 'rounded-sm', value: AppRadius.sm),
      _RadiusItemModel(label: 'rounded-md', value: AppRadius.md),
      _RadiusItemModel(label: 'rounded-lg', value: AppRadius.lg),
      _RadiusItemModel(label: 'rounded-xl', value: AppRadius.xl),
      _RadiusItemModel(label: 'rounded-2xl', value: AppRadius.xl2),
      _RadiusItemModel(label: 'rounded-3xl', value: AppRadius.xl3),
      _RadiusItemModel(label: 'rounded-4xl', value: AppRadius.xl4),
      _RadiusItemModel(label: 'rounded-full', value: AppRadius.full),
    ];

    return Builder(
      builder: (context) {
        int getCrossAxisCount(BuildContext context) {
          double width = MediaQuery.of(context).size.width;
          if (width < 600) return 2;
          if (width < 900) return 3;
          return 4;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(context),
            crossAxisSpacing: Dimens.px16,
            mainAxisSpacing: Dimens.px16,
            childAspectRatio: 0.9,
          ),
          itemCount: radiusItems.length,
          itemBuilder: (context, index) {
            return _RadiusCard(item: radiusItems[index]);
          },
        );
      },
    );
  }

  Widget _buildUsageExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Usage Examples',
          style: TextStyle(
            fontSize: Dimens.px20,
            fontWeight: FontWeight.w700,
            color: AppColors.neutral900,
          ),
        ),
        const SizedBox(height: Dimens.px16),
        Container(
          padding: const EdgeInsets.all(Dimens.px20),
          decoration: BoxDecoration(
            color: AppColors.neutral50,
            borderRadius: AppRadius.lgAll,
            border: Border.all(color: AppColors.neutral200),
          ),
          child: Column(
            children: [
              _buildExampleRow(
                'Card Example',
                'Cards with different border radius values',
                [
                  _buildExampleCard('None', AppRadius.noneAll),
                  _buildExampleCard('Small', AppRadius.smAll),
                  _buildExampleCard('Medium', AppRadius.mdAll),
                  _buildExampleCard('Large', AppRadius.lgAll),
                  _buildExampleCard('Full', AppRadius.fullAll),
                ],
              ),
              const SizedBox(height: Dimens.px24),
              _buildExampleRow(
                'Button Examples',
                'Buttons with different corner styles',
                [
                  _buildButtonExample('Default', AppRadius.mdAll),
                  _buildButtonExample('Pill', AppRadius.fullAll),
                  _buildButtonExample(
                    'Top Only',
                    AppRadius.only(topLeft: Dimens.px12, topRight: Dimens.px12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExampleRow(
    String title,
    String subtitle,
    List<Widget> examples,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: Dimens.px16,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral800,
          ),
        ),
        const SizedBox(height: Dimens.px4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: Dimens.px12,
            color: AppColors.neutral500,
          ),
        ),
        const SizedBox(height: Dimens.px12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: examples),
        ),
      ],
    );
  }

  Widget _buildExampleCard(String label, BorderRadiusGeometry radius) {
    return Container(
      width: Dimens.px112,
      margin: const EdgeInsets.only(right: Dimens.px12),
      child: Column(
        children: [
          Container(
            width: Dimens.px80,
            height: Dimens.px80,
            decoration: BoxDecoration(
              color: AppColors.brand100,
              borderRadius: radius,
              border: Border.all(color: AppColors.brand300),
            ),
            child: const Center(
              child: Icon(
                Icons.card_giftcard,
                color: AppColors.brand600,
                size: Dimens.px32,
              ),
            ),
          ),
          const SizedBox(height: Dimens.px4),
          Text(
            label,
            style: const TextStyle(
              fontSize: Dimens.px12,
              color: AppColors.neutral700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonExample(String label, BorderRadiusGeometry radius) {
    return Container(
      width: Dimens.px112,
      margin: const EdgeInsets.only(right: Dimens.px12),
      child: Column(
        children: [
          Container(
            width: Dimens.px96,
            height: Dimens.px40,
            decoration: BoxDecoration(
              color: AppColors.brand500,
              borderRadius: radius,
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: Dimens.px12,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadiusItemModel {
  final String label;
  final double value;

  _RadiusItemModel({required this.label, required this.value});
}

class _RadiusCard extends StatelessWidget {
  final _RadiusItemModel item;

  const _RadiusCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral200.withOpacity(0.5),
            blurRadius: Dimens.px4,
            offset: const Offset(0, Dimens.px2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Preview box with current radius
          Container(
            width: Dimens.px80,
            height: Dimens.px80,
            decoration: BoxDecoration(
              color: AppColors.brand100,
              borderRadius: BorderRadius.circular(item.value),
              border: Border.all(color: AppColors.brand300, width: Dimens.px1),
            ),
            child: const Center(
              child: Icon(
                Icons.square_rounded,
                color: AppColors.brand600,
                size: Dimens.px32,
              ),
            ),
          ),
          const SizedBox(height: Dimens.px12),
          // Label
          Text(
            item.label,
            style: const TextStyle(
              fontSize: Dimens.px14,
              fontWeight: FontWeight.w500,
              color: AppColors.neutral800,
            ),
          ),
          const SizedBox(height: Dimens.px4),
          // Value in pixels
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.px8,
              vertical: Dimens.px2,
            ),
            decoration: const BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: AppRadius.fullAll,
            ),
            child: Text(
              item.value == AppRadius.full ? 'full' : '${item.value.toInt()}px',
              style: const TextStyle(
                fontSize: Dimens.px12,
                color: AppColors.neutral600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

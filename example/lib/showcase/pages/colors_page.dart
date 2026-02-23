// lib/showcase/pages/colors_page.dart

import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/src/core/constants/dimens.dart';
import 'package:vamstreet_uikit/src/core/themes/app_colors.dart';
import 'package:vamstreet_uikit/src/core/themes/radius.dart';
import 'package:vamstreet_uikit/src/core/themes/typography.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors Showcase'),
        backgroundColor: const Color(AppColors.neutral50),
        elevation: Dimens.px0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.px16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: Dimens.px24),
            _buildBrandColors(),
            const SizedBox(height: Dimens.px32),
            _buildNeutralColors(),
            const SizedBox(height: Dimens.px32),
            _buildSemanticColors(),
            const SizedBox(height: Dimens.px32),
            _buildColorScales(),
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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(AppColors.violet500),
            const Color(AppColors.sky500),
          ],
        ),
        borderRadius: AppRadius.lgAll,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color System',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
              color: const Color(AppColors.white),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'Complete color palette for Vamstreet design system. '
            'Includes brand colors, neutral colors, and semantic colors.',
            style: AppTypography.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandColors() {
    final brandColors = [
      _ColorGroup(
        title: 'Brand Primary',
        colors: [
          _ColorItem('brand50', const Color(AppColors.brand50)),
          _ColorItem('brand100', const Color(AppColors.brand100)),
          _ColorItem('brand200', const Color(AppColors.brand200)),
          _ColorItem('brand300', const Color(AppColors.brand300)),
          _ColorItem('brand400', const Color(AppColors.brand400)),
          _ColorItem('brand500', const Color(AppColors.brand500)),
          _ColorItem('brand600', const Color(AppColors.brand600)),
          _ColorItem('brand700', const Color(AppColors.brand700)),
          _ColorItem('brand800', const Color(AppColors.brand800)),
          _ColorItem('brand900', const Color(AppColors.brand900)),
        ],
      ),
      _ColorGroup(
        title: 'Violet',
        colors: [
          _ColorItem('violet50', const Color(AppColors.violet50)),
          _ColorItem('violet100', const Color(AppColors.violet100)),
          _ColorItem('violet200', const Color(AppColors.violet200)),
          _ColorItem('violet300', const Color(AppColors.violet300)),
          _ColorItem('violet400', const Color(AppColors.violet400)),
          _ColorItem('violet500', const Color(AppColors.violet500)),
          _ColorItem('violet600', const Color(AppColors.violet600)),
          _ColorItem('violet700', const Color(AppColors.violet700)),
          _ColorItem('violet800', const Color(AppColors.violet800)),
          _ColorItem('violet900', const Color(AppColors.violet900)),
        ],
      ),
      _ColorGroup(
        title: 'Sky',
        colors: [
          _ColorItem('sky50', const Color(AppColors.sky50)),
          _ColorItem('sky100', const Color(AppColors.sky100)),
          _ColorItem('sky200', const Color(AppColors.sky200)),
          _ColorItem('sky300', const Color(AppColors.sky300)),
          _ColorItem('sky400', const Color(AppColors.sky400)),
          _ColorItem('sky500', const Color(AppColors.sky500)),
          _ColorItem('sky600', const Color(AppColors.sky600)),
          _ColorItem('sky700', const Color(AppColors.sky700)),
          _ColorItem('sky800', const Color(AppColors.sky800)),
          _ColorItem('sky900', const Color(AppColors.sky900)),
        ],
      ),
      _ColorGroup(
        title: 'Green',
        colors: [
          _ColorItem('green50', const Color(AppColors.green50)),
          _ColorItem('green100', const Color(AppColors.green100)),
          _ColorItem('green200', const Color(AppColors.green200)),
          _ColorItem('green300', const Color(AppColors.green300)),
          _ColorItem('green400', const Color(AppColors.green400)),
          _ColorItem('green500', const Color(AppColors.green500)),
          _ColorItem('green600', const Color(AppColors.green600)),
          _ColorItem('green700', const Color(AppColors.green700)),
          _ColorItem('green800', const Color(AppColors.green800)),
          _ColorItem('green900', const Color(AppColors.green900)),
        ],
      ),
      _ColorGroup(
        title: 'Amber',
        colors: [
          _ColorItem('amber50', const Color(AppColors.amber50)),
          _ColorItem('amber100', const Color(AppColors.amber100)),
          _ColorItem('amber200', const Color(AppColors.amber200)),
          _ColorItem('amber300', const Color(AppColors.amber300)),
          _ColorItem('amber400', const Color(AppColors.amber400)),
          _ColorItem('amber500', const Color(AppColors.amber500)),
          _ColorItem('amber600', const Color(AppColors.amber600)),
          _ColorItem('amber700', const Color(AppColors.amber700)),
          _ColorItem('amber800', const Color(AppColors.amber800)),
          _ColorItem('amber900', const Color(AppColors.amber900)),
        ],
      ),
      _ColorGroup(
        title: 'Pink',
        colors: [
          _ColorItem('pink50', const Color(AppColors.pink50)),
          _ColorItem('pink100', const Color(AppColors.pink100)),
          _ColorItem('pink200', const Color(AppColors.pink200)),
          _ColorItem('pink300', const Color(AppColors.pink300)),
          _ColorItem('pink400', const Color(AppColors.pink400)),
          _ColorItem('pink500', const Color(AppColors.pink500)),
          _ColorItem('pink600', const Color(AppColors.pink600)),
          _ColorItem('pink700', const Color(AppColors.pink700)),
          _ColorItem('pink800', const Color(AppColors.pink800)),
          _ColorItem('pink900', const Color(AppColors.pink900)),
        ],
      ),
      _ColorGroup(
        title: 'Red',
        colors: [
          _ColorItem('red50', const Color(AppColors.red50)),
          _ColorItem('red100', const Color(AppColors.red100)),
          _ColorItem('red200', const Color(AppColors.red200)),
          _ColorItem('red300', const Color(AppColors.red300)),
          _ColorItem('red400', const Color(AppColors.red400)),
          _ColorItem('red500', const Color(AppColors.red500)),
          _ColorItem('red600', const Color(AppColors.red600)),
          _ColorItem('red700', const Color(AppColors.red700)),
          _ColorItem('red800', const Color(AppColors.red800)),
          _ColorItem('red900', const Color(AppColors.red900)),
        ],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: brandColors.map((group) => _buildColorGroup(group)).toList(),
    );
  }

  Widget _buildNeutralColors() {
    final neutralColors = _ColorGroup(
      title: 'Neutral Colors',
      colors: [
        _ColorItem('white', const Color(AppColors.white)),
        _ColorItem('neutral50', const Color(AppColors.neutral50)),
        _ColorItem('neutral100', const Color(AppColors.neutral100)),
        _ColorItem('neutral200', const Color(AppColors.neutral200)),
        _ColorItem('neutral300', const Color(AppColors.neutral300)),
        _ColorItem('neutral400', const Color(AppColors.neutral400)),
        _ColorItem('neutral500', const Color(AppColors.neutral500)),
        _ColorItem('neutral600', const Color(AppColors.neutral600)),
        _ColorItem('neutral700', const Color(AppColors.neutral700)),
        _ColorItem('neutral800', const Color(AppColors.neutral800)),
        _ColorItem('neutral900', const Color(AppColors.neutral900)),
        _ColorItem('black', const Color(AppColors.black)),
      ],
    );

    return _buildColorGroup(neutralColors);
  }

  Widget _buildSemanticColors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Semantic Colors',
          style: AppTypography.textTheme.titleLarge?.copyWith(
            color: const Color(AppColors.neutral900),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Dimens.px16),
        Wrap(
          spacing: Dimens.px12,
          runSpacing: Dimens.px12,
          children: [
            _buildSemanticChip('Success', const Color(AppColors.green500)),
            _buildSemanticChip('Warning', const Color(AppColors.amber500)),
            _buildSemanticChip('Error', const Color(AppColors.red500)),
            _buildSemanticChip('Info', const Color(AppColors.sky500)),
            _buildSemanticChip('Brand', const Color(AppColors.brand500)),
          ],
        ),
      ],
    );
  }

  Widget _buildColorScales() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Scales',
          style: AppTypography.textTheme.titleLarge?.copyWith(
            color: const Color(AppColors.neutral900),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Dimens.px16),
        Container(
          padding: const EdgeInsets.all(Dimens.px20),
          decoration: BoxDecoration(
            color: const Color(AppColors.white),
            borderRadius: AppRadius.lgAll,
            border: Border.all(color: const Color(AppColors.neutral200)),
          ),
          child: Column(
            children: [
              _buildScaleRow('Brand', [
                const Color(AppColors.brand50),
                const Color(AppColors.brand100),
                const Color(AppColors.brand200),
                const Color(AppColors.brand300),
                const Color(AppColors.brand400),
                const Color(AppColors.brand500),
                const Color(AppColors.brand600),
                const Color(AppColors.brand700),
                const Color(AppColors.brand800),
                const Color(AppColors.brand900),
              ]),
              const SizedBox(height: Dimens.px16),
              _buildScaleRow('Violet', [
                const Color(AppColors.violet50),
                const Color(AppColors.violet100),
                const Color(AppColors.violet200),
                const Color(AppColors.violet300),
                const Color(AppColors.violet400),
                const Color(AppColors.violet500),
                const Color(AppColors.violet600),
                const Color(AppColors.violet700),
                const Color(AppColors.violet800),
                const Color(AppColors.violet900),
              ]),
              const SizedBox(height: Dimens.px16),
              _buildScaleRow('Sky', [
                const Color(AppColors.sky50),
                const Color(AppColors.sky100),
                const Color(AppColors.sky200),
                const Color(AppColors.sky300),
                const Color(AppColors.sky400),
                const Color(AppColors.sky500),
                const Color(AppColors.sky600),
                const Color(AppColors.sky700),
                const Color(AppColors.sky800),
                const Color(AppColors.sky900),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUsageExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Usage Examples',
          style: AppTypography.textTheme.titleLarge?.copyWith(
            color: const Color(AppColors.neutral900),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Dimens.px16),
        Container(
          padding: const EdgeInsets.all(Dimens.px20),
          decoration: BoxDecoration(
            color: Color(AppColors.white),
            borderRadius: AppRadius.lgAll,
            border: Border.all(color: Color(AppColors.neutral200)),
          ),
          child: Column(
            children: [
              _buildExampleRow('Buttons', [
                _buildExampleButton('Primary', Color(AppColors.brand500)),
                _buildExampleButton('Success', Color(AppColors.green500)),
                _buildExampleButton('Warning', Color(AppColors.amber500)),
                _buildExampleButton('Error', Color(AppColors.red500)),
              ]),
              const SizedBox(height: Dimens.px20),
              _buildExampleRow('Badges', [
                _buildExampleBadge('New', const Color(AppColors.violet500)),
                _buildExampleBadge('Sale', const Color(AppColors.pink500)),
                _buildExampleBadge('Hot', const Color(AppColors.red500)),
                _buildExampleBadge('Cool', const Color(AppColors.sky500)),
              ]),
              const SizedBox(height: Dimens.px20),
              _buildExampleRow('Gradients', [
                _buildGradientBox('Sunset', [
                  const Color(AppColors.pink500),
                  const Color(AppColors.amber500),
                ]),
                _buildGradientBox('Ocean', [
                  const Color(AppColors.sky500),
                  const Color(AppColors.violet500),
                ]),
                _buildGradientBox('Forest', [
                  const Color(AppColors.green500),
                  const Color(AppColors.sky500),
                ]),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorGroup(_ColorGroup group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          group.title,
          style: AppTypography.textTheme.titleLarge?.copyWith(
            color: const Color(AppColors.neutral900),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Dimens.px16),
        Wrap(
          spacing: Dimens.px8,
          runSpacing: Dimens.px8,
          children: group.colors
              .map((color) => _buildColorChip(color))
              .toList(),
        ),
        const SizedBox(height: Dimens.px24),
      ],
    );
  }

  Widget _buildColorChip(_ColorItem item) {
    return Tooltip(
      message: '${item.name}\n${_getColorHex(item.color)}',
      child: Container(
        width: Dimens.px80,
        decoration: BoxDecoration(
          color: const Color(AppColors.white),
          borderRadius: AppRadius.lgAll,
          border: Border.all(color: const Color(AppColors.neutral200)),
        ),
        child: Column(
          children: [
            Container(
              height: Dimens.px48,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: AppRadius.smAll,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.px8),
              child: Column(
                children: [
                  Text(
                    item.name,
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: const Color(AppColors.neutral800),
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Dimens.px2),
                  Text(
                    _getColorHex(item.color),
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: const Color(AppColors.neutral500),
                      fontSize: Dimens.px8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSemanticChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.px16,
        vertical: Dimens.px8,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.fullAll,
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Dimens.px12,
            height: Dimens.px12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: Dimens.px8),
          Text(
            label,
            style: AppTypography.textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScaleRow(String label, List<Color> colors) {
    return Row(
      children: [
        SizedBox(
          width: Dimens.px64,
          child: Text(
            label,
            style: AppTypography.textTheme.labelMedium?.copyWith(
              color: const Color(AppColors.neutral700),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: colors.asMap().entries.map((entry) {
              return Expanded(
                child: Container(
                  height: Dimens.px32,
                  color: entry.value,
                  child: Center(
                    child: Text(
                      '${(entry.key + 1) * 50}',
                      style: AppTypography.textTheme.labelSmall?.copyWith(
                        color: entry.key < 5
                            ? const Color(AppColors.neutral900)
                            : const Color(AppColors.white),
                        fontSize: Dimens.px10,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildExampleRow(String label, List<Widget> examples) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.textTheme.titleMedium?.copyWith(
            color: const Color(AppColors.neutral800),
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

  Widget _buildExampleButton(String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: Dimens.px12),
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.px16,
            vertical: Dimens.px8,
          ),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildExampleBadge(String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: Dimens.px12),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.px12,
        vertical: Dimens.px6,
      ),
      decoration: BoxDecoration(color: color, borderRadius: AppRadius.fullAll),
      child: Text(
        label,
        style: AppTypography.textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildGradientBox(String label, List<Color> colors) {
    return Container(
      width: Dimens.px112,
      height: Dimens.px64,
      margin: const EdgeInsets.only(right: Dimens.px12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.lgAll,
      ),
      child: Center(
        child: Text(
          label,
          style: AppTypography.textTheme.labelSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  String _getColorHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}

class _ColorGroup {
  final String title;
  final List<_ColorItem> colors;

  _ColorGroup({required this.title, required this.colors});
}

class _ColorItem {
  final String name;
  final Color color;

  _ColorItem(this.name, this.color);
}

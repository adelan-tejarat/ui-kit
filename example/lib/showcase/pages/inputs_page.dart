import 'package:flutter/material.dart';
import 'package:vamstreet_components/vamstreet_components.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  // State برای TextInput
  String? _errorInputValue = 'مقدار اشتباه';
  final String _disabledInputValue = 'مقدار غیرفعال';
  String? _inputErrorText; // برای نمایش خطا در TextInput

  // State برای DescriptionInput
  String? _errorDescriptionValue = 'توضیحات اشتباه';
  final String _disabledDescriptionValue = 'توضیحات غیرفعال';
  String? _longDescriptionValue =
      'این یک توضیحات طولانی است که در چند سطر نمایش داده می‌شود تا قابلیت multiline ویجت را نشان دهد.';
  String? _descriptionErrorText; // برای نمایش خطا در DescriptionInput

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs Showcase'),
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
            const SizedBox(height: Dimens.px32),

            // ======================================================
            // TEXT INPUT WIDGET
            // ======================================================
            _buildSectionTitle('Text Input Widget'),
            const SizedBox(height: Dimens.px24),
            _buildNormalInputWithStates(),
            const SizedBox(height: Dimens.px32),
            _buildSectionTitle('With Prefix & Suffix'),
            const SizedBox(height: Dimens.px16),
            _buildPrefixSuffixExamples(),
            const SizedBox(height: Dimens.px32),
            _buildSectionTitle('Other States'),
            const SizedBox(height: Dimens.px16),
            _buildOtherStates(),
            const SizedBox(height: Dimens.px32),
            _buildSectionTitle('Sizes (isLarge)'),
            const SizedBox(height: Dimens.px16),
            _buildSizes(),

            const SizedBox(height: Dimens.px48),

            // ======================================================
            // DESCRIPTION INPUT WIDGET
            // ======================================================
            _buildSectionTitle('Description Input Widget (4 Lines)'),
            const SizedBox(height: Dimens.px24),

            // Normal Description
            _buildNormalDescription(),

            const SizedBox(height: Dimens.px32),

            // Description States
            _buildSectionTitle('Description States'),
            const SizedBox(height: Dimens.px16),
            _buildDescriptionStates(),

            const SizedBox(height: Dimens.px32),

            // Description Examples
            _buildSectionTitle('Description Examples'),
            const SizedBox(height: Dimens.px16),
            _buildDescriptionExamples(),

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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(AppColors.brand500), Color(AppColors.violet600)],
        ),
        borderRadius: AppRadius.lgAll,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Input Showcase',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
              color: const Color(AppColors.white),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'Complete input components:\n'
                '• Text Input: 5 states • 2 sizes • Prefix/Suffix support\n'
                '• Description Input: 4 lines fixed height (padding: 12px all around)',
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

  // ======================================================
  // TEXT INPUT WIDGET SECTION
  // ======================================================

  Widget _buildNormalInputWithStates() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Normal Input',
            style: AppTypography.textTheme.titleMedium?.copyWith(
              color: const Color(AppColors.neutral800),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'این همان اینپوت نرمال است. در حالت‌های مختلف:',
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              color: const Color(AppColors.neutral600),
            ),
          ),
          const SizedBox(height: Dimens.px16),

          const TextInputWidget(
            labelText: 'ورودی نرمال',
            hintText: 'متن خود را وارد کنید',
          ),

          const SizedBox(height: Dimens.px24),

          Row(
            children: [
              _buildStateIndicator(
                'هاور',
                Icons.mouse,
                'بکگراند زرد می‌شود',
                const Color(AppColors.brand500),
              ),
              const SizedBox(width: Dimens.px16),
              _buildStateIndicator(
                'فوکوس',
                Icons.keyboard,
                'بوردر زرد می‌ماند',
                const Color(AppColors.brand600),
              ),
              const SizedBox(width: Dimens.px16),
              _buildStateIndicator(
                'خطا',
                Icons.error,
                'بوردر قرمز + متن خطا',
                const Color(AppColors.red500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrefixSuffixExamples() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        children: [
          _buildExampleRow(
            'Only Prefix',
            const TextInputWidget(
              labelText: 'جستجو',
              hintText: 'جستجو کنید...',
              prefix: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: Dimens.px16),
          _buildExampleRow(
            'Only Suffix',
            const TextInputWidget(
              labelText: 'رمز عبور',
              hintText: 'رمز خود را وارد کنید',
              suffix: Icon(Icons.visibility),
            ),
          ),
          const SizedBox(height: Dimens.px16),
          _buildExampleRow(
            'Both Prefix & Suffix',
            TextInputWidget(
              labelText: 'تلفن',
              hintText: 'شماره تلفن',
              prefix: const Icon(Icons.phone),
              suffix: const Icon(Icons.check_circle, color: Colors.green),
              onSuffixTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Suffix tapped!')));
              },
            ),
          ),
          const SizedBox(height: Dimens.px16),
          _buildExampleRow(
            'Clickable Suffix',
            TextInputWidget(
              labelText: 'کد تایید',
              hintText: 'کد را وارد کنید',
              suffix: const Icon(Icons.refresh),
              onSuffixTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Refresh tapped!')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherStates() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        children: [
          _buildStateRow(
            'خطا',
            Icons.error,
            const Color(AppColors.red500),
            TextInputWidget(
              errorText: _inputErrorText,
              labelText: 'فیلد با خطا',
              hintText: 'این فیلد خطا دارد',
              initialValue: _errorInputValue,
              suffix: const Icon(Icons.error, color: Colors.red),
              onChanged: (value) {
                setState(() {
                  _errorInputValue = value;
                  // نمایش خطا وقتی فیلد خالی است
                  _inputErrorText = value.isEmpty ? 'این فیلد نمی‌تواند خالی باشد' : null;
                });
              },
            ),
          ),
          const SizedBox(height: Dimens.px20),
          _buildStateRow(
            'غیرفعال',
            Icons.block,
            const Color(AppColors.neutral500),
            TextInputWidget(
              isDisabled: true,
              labelText: 'فیلد غیرفعال',
              hintText: 'این فیلد غیرفعال است',
              initialValue: _disabledInputValue,
              prefix: const Icon(Icons.lock),
              suffix: const Icon(Icons.info),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizes() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        children: [
          _buildSizeRow(
            label: 'کوچک',
            isLarge: false,
            desc: 'isLarge = false • vPadding: 12 • helperFont: 12',
            input: const TextInputWidget(
              isLarge: false,
              labelText: 'سایز کوچک',
              hintText: 'vertical padding: 12',
              prefix: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: Dimens.px20),
          _buildSizeRow(
            label: 'بزرگ',
            isLarge: true,
            desc: 'isLarge = true • vPadding: 16 • helperFont: 14',
            input: const TextInputWidget(
              isLarge: true,
              labelText: 'سایز بزرگ',
              hintText: 'vertical padding: 16',
              prefix: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }

  // ======================================================
  // DESCRIPTION INPUT WIDGET SECTION
  // ======================================================

  Widget _buildNormalDescription() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Normal Description (4 lines)',
            style: AppTypography.textTheme.titleMedium?.copyWith(
              color: const Color(AppColors.neutral800),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'ویجت توضیحات با ارتفاع ثابت ۴ سطر. پدینگ ۱۲ پیکسل از همه طرف.',
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              color: const Color(AppColors.neutral600),
            ),
          ),
          const SizedBox(height: Dimens.px16),

          const DescriptionInputWidget(
            labelText: 'توضیحات',
            hintText: 'توضیحات خود را وارد کنید...',
          ),

          const SizedBox(height: Dimens.px24),

          Container(
            padding: const EdgeInsets.all(Dimens.px12),
            decoration: const BoxDecoration(
              color: Color(AppColors.violet50),
              borderRadius: AppRadius.mdAll,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info,
                  size: Dimens.px20,
                  color: Color(AppColors.violet700),
                ),
                const SizedBox(width: Dimens.px8),
                Expanded(
                  child: Text(
                    'ارتفاع ثابت: ۴ سطر (۱۲۰px) • پدینگ: ۱۲px از همه طرف',
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: const Color(AppColors.violet700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionStates() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        children: [
          _buildDescriptionStateRow(
            'نرمال',
            Icons.description,
            const Color(AppColors.neutral600),
            const DescriptionInputWidget(
              labelText: 'توضیحات نرمال',
              hintText: 'توضیحات خود را وارد کنید...',
            ),
          ),
          const SizedBox(height: Dimens.px20),

          _buildDescriptionStateRow(
            'خطا',
            Icons.error,
            const Color(AppColors.red500),
            DescriptionInputWidget(
              errorText: _descriptionErrorText,
              labelText: 'توضیحات با خطا',
              hintText: 'این فیلد خطا دارد',
              initialValue: _errorDescriptionValue,
              onChanged: (value) {
                setState(() {
                  _errorDescriptionValue = value;
                  // نمایش خطا وقتی فیلد خالی است
                  _descriptionErrorText = value.isEmpty ? 'توضیحات نمی‌تواند خالی باشد' : null;
                });
              },
            ),
          ),
          const SizedBox(height: Dimens.px20),

          _buildDescriptionStateRow(
            'غیرفعال',
            Icons.block,
            const Color(AppColors.neutral500),
            DescriptionInputWidget(
              isDisabled: true,
              labelText: 'توضیحات غیرفعال',
              hintText: 'این فیلد غیرفعال است',
              initialValue: _disabledDescriptionValue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionExamples() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        children: [
          _buildDescriptionExampleRow(
            'با مقدار اولیه',
            DescriptionInputWidget(
              labelText: 'توضیحات محصول',
              hintText: 'توضیحات محصول را وارد کنید...',
              initialValue: _longDescriptionValue,
              onChanged: (value) {
                setState(() {
                  _longDescriptionValue = value;
                });
              },
            ),
          ),
          const SizedBox(height: Dimens.px20),

          _buildDescriptionExampleRow(
            'بدون لیبل (فقط hint)',
            const DescriptionInputWidget(
              hintText: 'توضیحات خود را اینجا بنویسید...',
            ),
          ),
        ],
      ),
    );
  }

  // ======================================================
  // Helper Widgets
  // ======================================================

  Widget _buildExampleRow(String label, Widget input) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Dimens.px8),
          child: Text(
            label,
            style: AppTypography.textTheme.labelLarge?.copyWith(
              color: const Color(AppColors.neutral600),
            ),
          ),
        ),
        input,
      ],
    );
  }

  Widget _buildStateIndicator(
      String label,
      IconData icon,
      String desc,
      Color color,
      ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(Dimens.px12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: AppRadius.mdAll,
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, size: Dimens.px20, color: color),
            const SizedBox(width: Dimens.px8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTypography.textTheme.labelMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    desc,
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: const Color(AppColors.neutral600),
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

  Widget _buildStateRow(
      String label,
      IconData icon,
      Color color,
      Widget input,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.px12,
            vertical: Dimens.px4,
          ),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: AppRadius.fullAll,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: Dimens.px16, color: color),
              const SizedBox(width: Dimens.px4),
              Text(
                label,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimens.px8),
        input,
      ],
    );
  }

  Widget _buildDescriptionStateRow(
      String label,
      IconData icon,
      Color color,
      Widget input,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.px12,
            vertical: Dimens.px4,
          ),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: AppRadius.fullAll,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: Dimens.px16, color: color),
              const SizedBox(width: Dimens.px4),
              Text(
                label,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimens.px8),
        input,
      ],
    );
  }

  Widget _buildDescriptionExampleRow(String label, Widget input) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.textTheme.labelLarge?.copyWith(
            color: const Color(AppColors.neutral600),
          ),
        ),
        const SizedBox(height: Dimens.px8),
        input,
      ],
    );
  }

  Widget _buildSizeRow({
    required String label,
    required bool isLarge,
    required String desc,
    required Widget input,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.px12,
            vertical: Dimens.px4,
          ),
          decoration: BoxDecoration(
            color: const Color(AppColors.violet50),
            borderRadius: AppRadius.fullAll,
            border: Border.all(color: const Color(AppColors.violet200)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isLarge ? Icons.height : Icons.height,
                size: Dimens.px16,
                color: const Color(AppColors.violet700),
              ),
              const SizedBox(width: Dimens.px4),
              Text(
                label,
                style: AppTypography.textTheme.labelMedium?.copyWith(
                  color: const Color(AppColors.violet700),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimens.px8),
        Text(
          desc,
          style: AppTypography.textTheme.labelSmall?.copyWith(
            color: const Color(AppColors.neutral600),
          ),
        ),
        const SizedBox(height: Dimens.px12),
        input,
      ],
    );
  }

  Widget _buildLegend() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(Dimens.px20),
        decoration: BoxDecoration(
          color: const Color(AppColors.neutral100),
          borderRadius: AppRadius.lgAll,
          border: Border.all(color: const Color(AppColors.neutral300)),
        ),
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
              spacing: Dimens.px16,
              runSpacing: Dimens.px8,
              children: [
                _buildLegendChip('نرمال', const Color(AppColors.neutral400)),
                _buildLegendChip('هاور', const Color(AppColors.brand500)),
                _buildLegendChip('فوکوس', const Color(AppColors.brand600)),
                _buildLegendChip('خطا', const Color(AppColors.red500)),
                _buildLegendChip('غیرفعال', const Color(AppColors.neutral400)),
                _buildLegendChip('۴ سطر', const Color(AppColors.violet600)),
              ],
            ),
            const SizedBox(height: Dimens.px12),
            Container(
              padding: const EdgeInsets.all(Dimens.px12),
              decoration: const BoxDecoration(
                color: Color(AppColors.white),
                borderRadius: AppRadius.mdAll,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLegendText(
                    '• Text Input: ورودی تک خط با قابلیت prefix/suffix',
                  ),
                  _buildLegendText(
                    '• Description Input: ورودی چند خط با ارتفاع ثابت ۴ سطر',
                  ),
                  _buildLegendText('  - پدینگ ۱۲ پیکسل از همه طرف'),
                  _buildLegendText('  - ارتفاع هر سطر: ۲۴ پیکسل'),
                  _buildLegendText('  - ارتفاع کل: ۱۲۰ پیکسل (۴ × ۲۴ + ۲۴)'),
                  _buildLegendText(
                    '• حالت هاور: با رفتن موس روی فیلد، بکگراند و بوردر زرد می‌شوند',
                  ),
                  _buildLegendText(
                    '• حالت فوکوس: با کلیک روی فیلد، بوردر زرد می‌ماند و بکگراند عادی می‌شود',
                  ),
                  _buildLegendText(
                    '• حالت خطا: با errorText=... بوردر قرمز و متن خطا نمایش داده می‌شود',
                  ),
                  _buildLegendText(
                    '• حالت غیرفعال: با isDisabled=true فیلد خاکستری می‌شود',
                  ),
                  _buildLegendText(
                    '• سایزها: isLarge=false (کوچک) و isLarge=true (بزرگ)',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.px12,
        vertical: Dimens.px4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.fullAll,
      ),
      child: Text(
        label,
        style: AppTypography.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildLegendText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.px4),
      child: Text(
        text,
        style: AppTypography.textTheme.bodySmall?.copyWith(
          color: const Color(AppColors.neutral700),
        ),
      ),
    );
  }
}

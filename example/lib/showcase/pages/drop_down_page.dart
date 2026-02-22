// example/lib/showcase/pages/selectbox_page.dart

import 'package:flutter/material.dart';
import 'package:vamstreet_components/vamstreet_components.dart';

class SelectBoxPage extends StatefulWidget {
  const SelectBoxPage({super.key});

  @override
  State<SelectBoxPage> createState() => _SelectBoxPageState();
}

class _SelectBoxPageState extends State<SelectBoxPage> {
  // State for controlled SelectBox examples
  String? _selectedCountry;
  String? _selectedCity;
  String? _selectedLanguage;
  String? _selectedError;
  String? _errorText;

  // Options data with more items for search demonstration
  final List<SelectOption<String>> _countryOptions = [
    const SelectOption(value: 'us', label: 'United States', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.red)),
    const SelectOption(value: 'uk', label: 'United Kingdom', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.blue)),
    const SelectOption(value: 'ca', label: 'Canada', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.red)),
    const SelectOption(value: 'au', label: 'Australia', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.blue)),
    const SelectOption(value: 'de', label: 'Germany', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.black)),
    const SelectOption(value: 'fr', label: 'France', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.blue)),
    const SelectOption(value: 'jp', label: 'Japan', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.red)),
    const SelectOption(value: 'br', label: 'Brazil', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.green)),
    const SelectOption(value: 'it', label: 'Italy', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.green)),
    const SelectOption(value: 'es', label: 'Spain', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.red)),
    const SelectOption(value: 'mx', label: 'Mexico', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.green)),
    const SelectOption(value: 'in', label: 'India', leadingIcon: Icon(Icons.flag, size: 20, color: Colors.orange)),
  ];

  final List<SelectOption<String>> _cityOptions = const [
    SelectOption(value: 'nyc', label: 'New York City'),
    SelectOption(value: 'la', label: 'Los Angeles'),
    SelectOption(value: 'chi', label: 'Chicago'),
    SelectOption(value: 'hou', label: 'Houston'),
    SelectOption(value: 'phx', label: 'Phoenix'),
    SelectOption(value: 'phi', label: 'Philadelphia'),
    SelectOption(value: 'san', label: 'San Antonio'),
    SelectOption(value: 'sd', label: 'San Diego'),
    SelectOption(value: 'dal', label: 'Dallas'),
    SelectOption(value: 'sj', label: 'San Jose'),
    SelectOption(value: 'aus', label: 'Austin'),
    SelectOption(value: 'jax', label: 'Jacksonville'),
  ];

  final List<SelectOption<String>> _languageOptions = const [
    SelectOption(value: 'en', label: 'English', leadingIcon: Icon(Icons.language, size: 20, color: Colors.blue)),
    SelectOption(value: 'es', label: 'Spanish', leadingIcon: Icon(Icons.language, size: 20, color: Colors.red)),
    SelectOption(value: 'fr', label: 'French', leadingIcon: Icon(Icons.language, size: 20, color: Colors.blue)),
    SelectOption(value: 'de', label: 'German', leadingIcon: Icon(Icons.language, size: 20, color: Colors.black)),
    SelectOption(value: 'fa', label: 'Persian (Farsi)', leadingIcon: Icon(Icons.language, size: 20, color: Colors.green)),
    SelectOption(value: 'ar', label: 'Arabic', leadingIcon: Icon(Icons.language, size: 20, color: Colors.green)),
    SelectOption(value: 'zh', label: 'Chinese', leadingIcon: Icon(Icons.language, size: 20, color: Colors.red)),
    SelectOption(value: 'ja', label: 'Japanese', leadingIcon: Icon(Icons.language, size: 20, color: Colors.red)),
    SelectOption(value: 'ko', label: 'Korean', leadingIcon: Icon(Icons.language, size: 20, color: Colors.blue)),
    SelectOption(value: 'ru', label: 'Russian', leadingIcon: Icon(Icons.language, size: 20, color: Colors.red)),
    SelectOption(value: 'hi', label: 'Hindi', leadingIcon: Icon(Icons.language, size: 20, color: Colors.orange)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectBox Showcase'),
        backgroundColor: const Color(AppColors.neutral50),
        elevation: Dimens.px0,
        centerTitle: true,
        actions: [
          // دکمه نمایش وضعیت هاور (اختیاری - برای آموزش)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(AppColors.brand50),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(AppColors.brand500),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'Hover to see effect',
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: const Color(AppColors.brand700),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
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
            // HOVER DEMONSTRATION
            // ======================================================
            _buildSectionTitle('Hover Effect Demonstration'),
            const SizedBox(height: Dimens.px8),
            _buildHoverExplanation(),
            const SizedBox(height: Dimens.px16),

            // ======================================================
            // BASIC SELECTBOX
            // ======================================================
            _buildSectionTitle('Basic SelectBox - Type to Search'),
            const SizedBox(height: Dimens.px16),
            _buildBasicExamples(),

            const SizedBox(height: Dimens.px32),

            // ======================================================
            // WITH PREFIX/SUFFIX
            // ======================================================
            _buildSectionTitle('With Prefix & Suffix'),
            const SizedBox(height: Dimens.px16),
            _buildPrefixSuffixExamples(),

            const SizedBox(height: Dimens.px32),

            // ======================================================
            // SIZES (isLarge)
            // ======================================================
            _buildSectionTitle('Sizes (isLarge)'),
            const SizedBox(height: Dimens.px16),
            _buildSizeExamples(),

            const SizedBox(height: Dimens.px32),

            // ======================================================
            // STATES
            // ======================================================
            _buildSectionTitle('SelectBox States'),
            const SizedBox(height: Dimens.px16),
            _buildStateExamples(),

            const SizedBox(height: Dimens.px32),

            // ======================================================
            // WITH LEADING ICONS
            // ======================================================
            _buildSectionTitle('With Leading Icons'),
            const SizedBox(height: Dimens.px16),
            _buildLeadingIconExamples(),

            const SizedBox(height: Dimens.px32),

            // ======================================================
            // REAL WORLD EXAMPLES
            // ======================================================
            _buildSectionTitle('Real World Examples'),
            const SizedBox(height: Dimens.px16),
            _buildRealWorldExamples(),

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
            'SelectBox Component',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
              color: const Color(AppColors.white),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'Enterprise-grade searchable dropdown with hover effect\n'
                '• 2 sizes: Small (isLarge=false) • Large (isLarge=true)\n'
                '• 5 states: Normal • Hover • Focus • Error • Disabled\n'
                '• Prefix/Suffix support • Click handlers\n'
                '• Type directly in the field • Real-time filtering\n'
                '• Leading icons support',
            style: AppTypography.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoverExplanation() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px16),
      decoration: BoxDecoration(
        color: const Color(AppColors.brand50).withOpacity(0.5),
        borderRadius: AppRadius.mdAll,
        border: Border.all(color: const Color(AppColors.brand200)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(AppColors.brand100),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.mouse,
              color: Color(AppColors.brand700),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hover Effect',
                  style: AppTypography.textTheme.titleSmall?.copyWith(
                    color: const Color(AppColors.brand800),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Move your mouse over any SelectBox below to see the hover effect:\n'
                      '• Border becomes yellow\n'
                      '• Background becomes light yellow (when not focused)\n'
                      '• Icons become yellow',
                  style: AppTypography.textTheme.bodySmall?.copyWith(
                    color: const Color(AppColors.brand700),
                  ),
                ),
              ],
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

  Widget _buildBasicExamples() {
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
            'Simple SelectBox',
            SelectBox<String>(
              options: _cityOptions,
              value: _selectedCity,
              onChanged: (value) => setState(() => _selectedCity = value),
              labelText: 'Select City',
              hintText: 'Type city name...',
            ),
          ),
          const SizedBox(height: Dimens.px16),
          _buildExampleRow(
            'With Hint Text',
            SelectBox<String>(
              options: _cityOptions,
              value: _selectedCity,
              onChanged: (value) => setState(() => _selectedCity = value),
              labelText: 'Select City',
              hintText: 'Start typing to search...',
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Container(
            padding: const EdgeInsets.all(Dimens.px12),
            decoration: BoxDecoration(
              color: const Color(AppColors.brand50),
              borderRadius: AppRadius.mdAll,
            ),
            child: Row(
              children: [
                const Icon(Icons.info, size: Dimens.px20, color: Color(AppColors.brand700)),
                const SizedBox(width: Dimens.px8),
                Expanded(
                  child: Text(
                    'Click on the field and start typing - results filter as you type',
                    style: AppTypography.textTheme.bodySmall?.copyWith(
                      color: const Color(AppColors.brand700),
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
            SelectBox<String>(
              options: _cityOptions,
              value: _selectedCity,
              onChanged: (value) => setState(() => _selectedCity = value),
              labelText: 'Search City',
              hintText: 'Type city name...',
              prefix: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: Dimens.px16),

          _buildExampleRow(
            'Only Suffix',
            SelectBox<String>(
              options: _languageOptions,
              value: _selectedLanguage,
              onChanged: (value) => setState(() => _selectedLanguage = value),
              labelText: 'Select Language',
              hintText: 'Type language...',
              suffix: const Icon(Icons.language),
            ),
          ),
          const SizedBox(height: Dimens.px16),

          _buildExampleRow(
            'Both Prefix & Suffix',
            SelectBox<String>(
              options: _countryOptions,
              value: _selectedCountry,
              onChanged: (value) => setState(() => _selectedCountry = value),
              labelText: 'Select Country',
              hintText: 'Type country...',
              prefix: const Icon(Icons.public),
              suffix: const Icon(Icons.info, color: Colors.blue),
              onSuffixTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Country info')),
                );
              },
            ),
          ),
          const SizedBox(height: Dimens.px16),

          _buildExampleRow(
            'Clickable Suffix',
            SelectBox<String>(
              options: _languageOptions,
              value: _selectedLanguage,
              onChanged: (value) => setState(() => _selectedLanguage = value),
              labelText: 'Select Language',
              hintText: 'Type language...',
              suffix: const Icon(Icons.refresh),
              onSuffixTap: () {
                setState(() {
                  _selectedLanguage = null;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Selection cleared')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeExamples() {
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
            label: 'Small',
            isLarge: false,
            desc: 'isLarge = false • height: 48px • text font: 14',
            input: SelectBox<String>(
              isLarge: false,
              options: _languageOptions,
              value: _selectedLanguage,
              onChanged: (value) => setState(() => _selectedLanguage = value),
              labelText: 'Small SelectBox',
              hintText: 'Type language...',
              prefix: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: Dimens.px20),
          _buildSizeRow(
            label: 'Large',
            isLarge: true,
            desc: 'isLarge = true • height: 56px • text font: 16',
            input: SelectBox<String>(
              isLarge: true,
              options: _languageOptions,
              value: _selectedLanguage,
              onChanged: (value) => setState(() => _selectedLanguage = value),
              labelText: 'Large SelectBox',
              hintText: 'Type language...',
              prefix: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStateExamples() {
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
            'Normal',
            Icons.check_circle,
            const Color(AppColors.neutral600),
            SelectBox<String>(
              options: _cityOptions,
              labelText: 'Normal State',
              hintText: 'Type to search',
              prefix: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: Dimens.px16),
          _buildStateRow(
            'Error',
            Icons.error,
            const Color(AppColors.red500),
            SelectBox<String>(
              options: _cityOptions,
              labelText: 'Error State',
              hintText: 'Type to search',
              errorText: _errorText,
              prefix: const Icon(Icons.error, color: Colors.red),
              onChanged: (value) {
                setState(() {
                  _selectedError = value;
                  _errorText = value == null ? 'Please select a city' : null;
                });
              },
            ),
          ),
          const SizedBox(height: Dimens.px16),
          _buildStateRow(
            'Disabled',
            Icons.block,
            const Color(AppColors.neutral500),
            SelectBox<String>(
              isDisabled: true,
              options: _cityOptions,
              labelText: 'Disabled State',
              hintText: 'Cannot type',
              value: _cityOptions.first.value,
              prefix: const Icon(Icons.lock),
              suffix: const Icon(Icons.block),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingIconExamples() {
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
            'Countries with Flags',
            SelectBox<String>(
              options: _countryOptions,
              value: _selectedCountry,
              onChanged: (value) => setState(() => _selectedCountry = value),
              labelText: 'Select Country',
              hintText: 'Type country name...',
              prefix: const Icon(Icons.public),
            ),
          ),
          const SizedBox(height: Dimens.px16),
          _buildExampleRow(
            'Languages with Icons',
            SelectBox<String>(
              options: _languageOptions,
              value: _selectedLanguage,
              onChanged: (value) => setState(() => _selectedLanguage = value),
              labelText: 'Select Language',
              hintText: 'Type language name...',
              prefix: const Icon(Icons.language),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRealWorldExamples() {
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
            'User Registration Form',
            style: AppTypography.textTheme.titleMedium?.copyWith(
              color: const Color(AppColors.neutral800),
            ),
          ),
          const SizedBox(height: Dimens.px16),

          // Country
          SelectBox<String>(
            options: _countryOptions,
            value: _selectedCountry,
            onChanged: (value) => setState(() => _selectedCountry = value),
            labelText: 'Country of Residence',
            hintText: 'Type your country...',
            isLarge: true,
            prefix: const Icon(Icons.public),
          ),
          const SizedBox(height: Dimens.px16),

          // City
          SelectBox<String>(
            options: _cityOptions,
            value: _selectedCity,
            onChanged: (value) => setState(() => _selectedCity = value),
            labelText: 'City',
            hintText: 'Type your city...',
            isLarge: true,
            prefix: const Icon(Icons.location_city),
          ),
          const SizedBox(height: Dimens.px16),

          // Preferred Language
          SelectBox<String>(
            options: _languageOptions,
            value: _selectedLanguage,
            onChanged: (value) => setState(() => _selectedLanguage = value),
            labelText: 'Preferred Language',
            hintText: 'Type language...',
            isLarge: true,
            prefix: const Icon(Icons.language),
          ),

          const SizedBox(height: Dimens.px16),
          Container(
            padding: const EdgeInsets.all(Dimens.px12),
            decoration: BoxDecoration(
              color: const Color(AppColors.green50),
              borderRadius: AppRadius.mdAll,
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, size: Dimens.px20, color: Color(AppColors.green700)),
                const SizedBox(width: Dimens.px8),
                Expanded(
                  child: Text(
                    'Selected: ${_selectedCountry ?? 'None'} / ${_selectedCity ?? 'None'} / ${_selectedLanguage ?? 'None'}',
                    style: AppTypography.textTheme.bodySmall?.copyWith(
                      color: const Color(AppColors.green700),
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

  Widget _buildStateRow(String label, IconData icon, Color color, Widget input) {
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
                _buildLegendChip('پیشوند', const Color(AppColors.violet600)),
                _buildLegendChip('پسوند', const Color(AppColors.violet600)),
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
                  _buildLegendText('• SelectBox: کامپوننت dropdown با قابلیت جستجو'),
                  _buildLegendText('• قابلیت تایپ: می‌توانید مستقیماً در فیلد تایپ کنید'),
                  _buildLegendText('• جستجوی لحظه‌ای: با تایپ کردن، لیست گزینه‌ها فیلتر می‌شود'),
                  _buildLegendText('• سایزها: isLarge=false (کوچک - 48px) و isLarge=true (بزرگ - 56px)'),
                  _buildLegendText('• Prefix/Suffix: قابلیت اضافه کردن آیکون در دو طرف'),
                  _buildLegendText('• کلیک روی آیکون‌ها: قابل برنامه‌ریزی با onPrefixTap/onSuffixTap'),
                  _buildLegendText('• آیکون‌های leading: قابل نمایش کنار هر گزینه'),
                  _buildLegendText('• حالت‌ها: نرمال، هاور، فوکوس، خطا، غیرفعال'),
                  _buildLegendText('  - هاور: با رفتن موس روی فیلد، border و آیکون‌ها زرد می‌شوند'),
                  _buildLegendText('  - بکگراند در حالت هاور: زرد کمرنگ (وقتی فوکوس نیست)'),
                  _buildLegendText('  - اولویت: Disabled > Error > Focus > Hover > Normal'),
                  _buildLegendText('• مدیریت خطا: با errorText مانند TextInputWidget'),
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
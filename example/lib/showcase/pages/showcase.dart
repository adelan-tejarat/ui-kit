import 'package:flutter/material.dart';
import 'package:vamstreet_components/src/core/constants/dimens.dart';
import 'package:vamstreet_components/src/core/themes/app_colors.dart';
import 'package:vamstreet_components/src/core/themes/radius.dart';
import 'package:vamstreet_components/src/core/themes/typography.dart';
import 'package:vamstreet_components_example/showcase/pages/selectable_buttons_page.dart';
import 'package:vamstreet_components_example/showcase/pages/toast_page.dart' show ToastPage;

// ایمپورت پیج‌ها
import 'blur_page.dart';
import 'colors_page.dart';
import 'drop_down_page.dart';
import 'icon_page.dart';
import 'radius_page.dart';
import 'typography_page.dart';
import 'opacity_page.dart';
import 'buttons_page.dart';
import 'inputs_page.dart';

class ShowCaseApp extends StatelessWidget {
  ShowCaseApp({super.key});

  // لیست تمام صفحات برای نمایش
  final List<ShowcasePage> _pages = [
    ShowcasePage(
      title: 'Toast',
      subtitle: 'Toast notifications • 4 types • Custom actions',
      icon: Icons.notifications,
      color: const Color(AppColors.brand500),
      page: const ToastPage(),
    ),
    ShowcasePage(
      title: 'SelectBox',
      subtitle: 'Dropdown with TextInputWidget standards',
      icon: Icons.arrow_drop_down_circle,
      color: const Color(AppColors.violet600), // یه رنگ جدید
      page: const SelectBoxPage(),
    ),
    ShowcasePage(
      title: 'Selectable Buttons',
      subtitle: 'Radio-like selectable component with 2 sizes and 4 states',
      icon: Icons.radio_button_checked,
      color: const Color(AppColors.amber600),
      page: const RadioButtonsPage(),
    ),
    ShowcasePage(
      title: 'Blur Effects',
      subtitle: 'Blur values from none to 3xl',
      icon: Icons.blur_circular,
      color: const Color(AppColors.violet500),
      page: const BlurPage(),
    ),
    ShowcasePage(
      title: 'Colors', // اضافه کردن صفحه جدید
      subtitle: 'Complete color system',
      icon: Icons.color_lens,
      color: const Color(AppColors.brand500),
      page: const ColorsPage(),
    ),
    ShowcasePage(
      title: 'Icons',
      subtitle: 'SVG icons library',
      icon: Icons.emoji_emotions,
      color: const Color(AppColors.violet500),
      page: const IconsPage(), // اضافه کردن صفحه جدید
    ),
    ShowcasePage(
      title: 'Border Radius',
      subtitle: 'Complete radius scale',
      icon: Icons.square_rounded,
      color: const Color(AppColors.sky500),
      page: const RadiusPage(),
    ),
    ShowcasePage(
      title: 'Typography',
      subtitle: 'Text styles and fonts',
      icon: Icons.text_fields,
      color: const Color(AppColors.green500),
      page: const TypographyPage(),
    ),
    ShowcasePage(
      title: 'Opacity',
      subtitle: 'Opacity values and utilities',
      icon: Icons.opacity,
      color: const Color(AppColors.amber500),
      page: const OpacityPage(),
    ),
    ShowcasePage(
      title: 'Buttons',
      subtitle: 'Button styles and states',
      icon: Icons.smart_button,
      color: const Color(AppColors.pink500),
      page: const ButtonsPage(),
    ),
    ShowcasePage(
      title: 'Inputs',
      subtitle: 'Form inputs and fields',
      icon: Icons.input,
      color: const Color(AppColors.brand500),
      page: const InputsPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColors.neutral50),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Expanded(child: _buildPagesGrid(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px16), // کاهش از 24 به 16
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        border: Border(
          bottom: BorderSide(
            color: const Color(AppColors.neutral200),
            width: Dimens.px1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(Dimens.px8), // کاهش از 12 به 8
                decoration: BoxDecoration(
                  color: const Color(AppColors.brand50),
                  borderRadius: AppRadius.lgAll,
                ),
                child: Icon(
                  Icons.dashboard_customize,
                  color: const Color(AppColors.brand600),
                  size: Dimens.px20, // کاهش از 28 به 20
                ),
              ),
              const SizedBox(width: Dimens.px12), // کاهش از 16 به 12
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vamstreet Components',
                      style: AppTypography.textTheme.titleMedium?.copyWith(
                        // تغییر به سایز کوچکتر
                        color: const Color(AppColors.neutral900),
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'UI Kit Showcase',
                      style: AppTypography.textTheme.bodySmall?.copyWith(
                        // تغییر به سایز کوچکتر
                        color: const Color(AppColors.neutral600),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimens.px12), // کاهش از 20 به 12
          Container(
            padding: const EdgeInsets.all(Dimens.px12), // کاهش از 16 به 12
            decoration: BoxDecoration(
              color: const Color(AppColors.neutral100),
              borderRadius: AppRadius.lgAll,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: Dimens.px16, // کاهش از 20 به 16
                  color: const Color(AppColors.neutral500),
                ),
                const SizedBox(width: Dimens.px8), // کاهش از 12 به 8
                Expanded(
                  child: Text(
                    'Select a component to see its showcase',
                    style: AppTypography.textTheme.labelMedium?.copyWith(
                      // تغییر به سایز کوچکتر
                      color: const Color(AppColors.neutral700),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPagesGrid(context) {
    return GridView.builder(
      padding: const EdgeInsets.all(Dimens.px12), // کاهش از 16 به 12
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(context),
        crossAxisSpacing: Dimens.px8, // کاهش از 12 به 8
        mainAxisSpacing: Dimens.px8, // کاهش از 12 به 8
        childAspectRatio: _getAspectRatio(
          context,
        ), // اضافه کردن aspect ratio داینامیک
      ),
      itemCount: _pages.length,
      itemBuilder: (context, index) {
        return _PageCard(
          page: _pages[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _pages[index].page),
            );
          },
        );
      },
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 400) return 1;
    if (width < 600) return 2;
    if (width < 900) return 3;
    return 4;
  }

  double _getAspectRatio(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // برای صفحه‌های کوچیک نسبت ارتفاع به عرض کمتر
    if (width < 400) return 1.3;
    if (width < 600) return 1.2;
    return 1.1;
  }
}

class ShowcasePage {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  ShowcasePage({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
  });
}

class _PageCard extends StatelessWidget {
  final ShowcasePage page;
  final VoidCallback onTap;

  const _PageCard({required this.page, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // محاسبه سایز آیکون بر اساس عرض کارت
        double iconSize = constraints.maxWidth * 0.25;
        iconSize = iconSize.clamp(24, 40); // محدود کردن بین 24 و 40

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.lgAll,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(AppColors.white),
                borderRadius: AppRadius.lgAll,
                border: Border.all(
                  color: const Color(AppColors.neutral200),
                  width: Dimens.px1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top colored section with icon
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: page.color.withOpacity(0.1),
                        borderRadius: AppRadius.lgAll,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none, // اجازه نمایش خارج از bounds
                        children: [
                          Positioned(
                            right: -iconSize * 0.5, // تنظیم بر اساس سایز آیکون
                            bottom: -iconSize * 0.5,
                            child: Icon(
                              page.icon,
                              size: iconSize * 2.5, // آیکون پس‌زمینه بزرگ
                              color: page.color.withOpacity(0.15),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(iconSize * 0.3),
                              decoration: BoxDecoration(
                                color: page.color.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                page.icon,
                                size: iconSize,
                                color: page.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Bottom content section
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(
                        constraints.maxWidth * 0.03,
                      ), // padding نسبی
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            // برای جلوگیری از overflow متن
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              page.title,
                              style: AppTypography.textTheme.labelLarge
                                  ?.copyWith(
                                    color: const Color(AppColors.neutral900),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          const SizedBox(height: Dimens.px2),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              page.subtitle,
                              style: AppTypography.textTheme.labelSmall
                                  ?.copyWith(
                                    color: const Color(AppColors.neutral600),
                                  ),
                            ),
                          ),
                          const SizedBox(height: Dimens.px4),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxWidth * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: page.color.withOpacity(0.1),
                              borderRadius: AppRadius.fullAll,
                            ),
                            child: Text(
                              'View →',
                              style: AppTypography.textTheme.labelSmall
                                  ?.copyWith(
                                    color: page.color,
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        constraints.maxWidth *
                                        0.03, // فونت نسبی
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
          ),
        );
      },
    );
  }
}

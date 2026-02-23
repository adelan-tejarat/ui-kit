// example/lib/showcase/pages/toast_page.dart

import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/vamstreet_uikit.dart';

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<ToastPage> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Showcase'),
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
            // TOASTS WITH CLOSE BUTTON
            // ======================================================
             const SizedBox(height: Dimens.px8),
            _buildCloseButtonInfo(),
            const SizedBox(height: Dimens.px16),
            _buildToasts(),
            const SizedBox(height: Dimens.px32),
            // ======================================================
            // UTILITIES
            // ======================================================
             const SizedBox(height: Dimens.px16),
            _buildUtilities(),

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
            'Toast Notification System',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
              color: const Color(AppColors.white),
            ),
          ),
          const SizedBox(height: Dimens.px8),
          Text(
            'Toast notifications powered by ToastService\n'
                '• 4 types: Success • Error • Warning • Info\n'
                '• Custom close button with icon color matching toast type\n'
                '• Customizable duration • RTL support',
            style: AppTypography.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButtonInfo() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px12),
      decoration: BoxDecoration(
        color: const Color(AppColors.brand50),
        borderRadius: AppRadius.mdAll,
        border: Border.all(color: const Color(AppColors.brand200)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(AppColors.brand100),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.info,
              size: 16,
              color: Color(AppColors.brand700),
            ),
          ),
          const SizedBox(width: Dimens.px8),
          Expanded(
            child: Text(
              'دکمه Close با رنگ آیکون هر Toast هماهنگ است',
              style: AppTypography.textTheme.bodySmall?.copyWith(
                color: const Color(AppColors.brand700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToasts() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        children: [
          _buildToastButton(
            label: 'Success',
            icon: Icons.check_circle,
            color: const Color(AppColors.green600),
            onPressed: () {
              ToastService.showSuccess(
                title: 'عملیات موفق',
                description: 'اطلاعات با موفقیت ذخیره شد',
                context: context,
              );
            },
          ),
          const SizedBox(height: Dimens.px12),
          _buildToastButton(
            label: 'Error',
            icon: Icons.error,
            color: const Color(AppColors.red600),
            onPressed: () {
              ToastService.showError(
                title: 'خطا در اتصال',
                description: 'لطفاً اتصال اینترنت خود را بررسی کنید',
                context: context,
              );
            },
          ),
          const SizedBox(height: Dimens.px12),
          _buildToastButton(
            label: 'Warning',
            icon: Icons.warning,
            color: const Color(AppColors.brand600),
            onPressed: () {
              ToastService.showWarning(
                title: 'هشدار',
                description: 'این عملیات غیرقابل برگشت است',
                context: context,
              );
            },
          ),
          const SizedBox(height: Dimens.px12),
          _buildToastButton(
            label: 'Info',
            icon: Icons.info,
            color: const Color(AppColors.sky600),
            onPressed: () {
              ToastService.showInfo(
                title: 'اطلاعیه',
                description: 'نسخه جدید برنامه منتشر شد',
                context: context,
              );
            },
          ),
        ],
      ),
    );
  }


  Widget _buildUtilities() {
    return Container(
      padding: const EdgeInsets.all(Dimens.px20),
      decoration: BoxDecoration(
        color: const Color(AppColors.white),
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: const Color(AppColors.neutral200)),
      ),
      child: Column(
        children: [
          _buildToastButton(
            label: 'پاک کردن همه Toast‌ها',
            icon: Icons.clear_all,
            color: const Color(AppColors.red500),
            onPressed: () {
              ToastService.dismissAll();
              ToastService.showInfo(
                title: 'پاکسازی شد',
                description: 'همه Toast‌ها بسته شدند',
                context: context,
                duration: const Duration(seconds: 2),
              );
            },
          ),
          const SizedBox(height: Dimens.px12),
          _buildToastButton(
            label: 'نمایش ۴ Toast پشت سر هم',
            icon: Icons.queue,
            color: const Color(AppColors.brand500),
            onPressed: () {
              ToastService.showSuccess(
                title: 'مرحله ۱',
                description: 'در حال پردازش...',
                context: context,
                duration: const Duration(seconds: 2),
              );

              Future.delayed(const Duration(milliseconds: 500), () {
                ToastService.showInfo(
                  title: 'مرحله ۲',
                  description: 'اطلاعات دریافت شد',
                  context: context,
                  duration: const Duration(seconds: 2),
                );
              });

              Future.delayed(const Duration(milliseconds: 1000), () {
                ToastService.showWarning(
                  title: 'مرحله ۳',
                  description: 'در حال تایید...',
                  context: context,
                  duration: const Duration(seconds: 2),
                );
              });

              Future.delayed(const Duration(milliseconds: 1500), () {
                ToastService.showSuccess(
                  title: 'مرحله ۴',
                  description: 'عملیات با موفقیت انجام شد',
                  context: context,
                  duration: const Duration(seconds: 3),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToastButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: Dimens.px20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.px16,
            vertical: Dimens.px12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
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
                _buildLegendChip('Success', const Color(AppColors.green600)),
                _buildLegendChip('Error', const Color(AppColors.red600)),
                _buildLegendChip('Warning', const Color(AppColors.brand600)),
                _buildLegendChip('Info', const Color(AppColors.sky600)),
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
                  _buildLegendText('• CloseButtonWidget: فقط با color و icon'),
                  _buildLegendText('• رنگ دکمه Close با رنگ آیکون اصلی هماهنگ است'),
                  _buildLegendText('• دایره ۲۸px با پس‌زمینه 0.1 opacity از رنگ اصلی'),
                  _buildLegendText('• آیکون ۱۶px با رنگ اصلی'),
                  _buildLegendText('• افکت ripple با splashColor 0.2 opacity'),
                  _buildLegendText('• ToastService: ۴ نوع اصلی'),
                  _buildLegendText('• قابلیت نمایش/عدم نمایش دکمه Close با showCloseButton'),
                  _buildLegendText('• پشتیبانی کامل از RTL'),
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

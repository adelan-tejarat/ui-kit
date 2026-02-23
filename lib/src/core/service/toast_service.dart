// lib/src/services/toast_service.dart

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:vamstreet_uikit/vamstreet_uikit.dart' show AppColors;

// Enum برای سایز Toast
enum ToastSize {
  regular, // سایز معمولی (پیش‌فرض)
  compact, // سایز کوچک (نصف ارتفاع)
}

class ToastService {
  ToastService._();

  // ======================================================
  // PRIVATE METHODS
  // ======================================================

  static ToastificationItem _showToast({
    required String title,
    String? description,
    required ToastificationType type,
    required Color iconColor,
    required Color primaryColor,
    required Color backgroundColor,
    required Color borderColor,
    BuildContext? context,
    Duration duration = const Duration(seconds: 4),
    ToastSize size = ToastSize.regular,
  }) {
    // تنظیمات بر اساس سایز
    final isCompact = size == ToastSize.compact;

    return toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flatColored,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: isCompact ? 12 : 14,
          color: primaryColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      description: description != null
          ? Text(
        description,
        style: TextStyle(
          fontSize: isCompact ? 10 : 12,
          color: primaryColor,
        ),
        maxLines: isCompact ? 1 : 2,
        overflow: TextOverflow.ellipsis,
      )
          : null,
      alignment: Alignment.topCenter,
      autoCloseDuration: duration,
      icon: Container(
        padding: EdgeInsets.all(isCompact ? 2 : 4),
        child: Icon(
          _getIconForType(type),
          color: iconColor,
          size: isCompact ? 16 : 20,
        ),
      ),
      borderRadius: BorderRadius.circular(isCompact ? 8.0 : 12.0),
      direction: TextDirection.rtl,
      primaryColor: borderColor, // رنگ border
      backgroundColor: backgroundColor,
      foregroundColor: primaryColor,
      showProgressBar: false,

      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      margin: isCompact
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 4)
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: isCompact
          ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  static IconData _getIconForType(ToastificationType type) {
    switch (type) {
      case ToastificationType.success:
        return Icons.check_circle;
      case ToastificationType.error:
        return Icons.error;
      case ToastificationType.warning:
        return Icons.warning;
      default:
        return Icons.info;
    }
  }

  // ======================================================
  // PUBLIC METHODS - REGULAR SIZE
  // ======================================================

  /// نمایش Toast موفقیت (سبز) با سایز معمولی - مطابق SVG
  static void showSuccess({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.success,
      iconColor:const Color(AppColors.green600) ,
      primaryColor: const Color(AppColors.green900),
      backgroundColor: const Color(AppColors.green50),
      borderColor: const Color(AppColors.green600),
      context: context,
      duration: duration,
      size: ToastSize.regular,
    );
  }

  /// نمایش Toast خطا (قرمز) با سایز معمولی - مطابق SVG
  static void showError({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.error,
      iconColor:const Color(AppColors.red600) ,
      primaryColor: const Color(AppColors.red900),
      backgroundColor: const Color(AppColors.red50),
      borderColor: const Color(AppColors.red600),
      context: context,
      duration: duration,
      size: ToastSize.regular,
    );
  }

  /// نمایش Toast خطا (قرمز) با سایز معمولی - نسخه دوم (راست)
  static void showErrorDark({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.error,
      iconColor:const Color(AppColors.red600) ,
      primaryColor: const Color(AppColors.red900),
      backgroundColor: const Color(AppColors.red50),
      borderColor: const Color(AppColors.red600),
      context: context,
      duration: duration,
      size: ToastSize.regular,
    );
  }

  /// نمایش Toast هشدار (نارنجی) با سایز معمولی - مطابق SVG
  static void showWarning({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.warning,
      iconColor:const Color(AppColors.brand600) ,
      primaryColor: const Color(AppColors.brand900),
      backgroundColor: const Color(AppColors.brand50),
      borderColor: const Color(AppColors.brand600),
      context: context,
      duration: duration,
      size: ToastSize.regular,
    );
  }

  /// نمایش Toast هشدار (نارنجی) با سایز معمولی - نسخه دوم (راست)
  static void showWarningDark({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.warning,
      iconColor:const Color(AppColors.brand600) ,
      primaryColor: const Color(AppColors.brand900),
      backgroundColor: const Color(AppColors.brand50),
      borderColor: const Color(AppColors.brand600),
      context: context,
      duration: duration,
      size: ToastSize.regular,
    );
  }

  /// نمایش Toast اطلاعات (آبی) با سایز معمولی - مطابق SVG
  static void showInfo({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.info,
      iconColor:const Color(AppColors.sky600) ,
      primaryColor: const Color(AppColors.sky900),
      backgroundColor: const Color(AppColors.sky50),
      borderColor: const Color(AppColors.sky600),
      context: context,
      duration: duration,
      size: ToastSize.regular,
    );
  }

  // ======================================================
  // PUBLIC METHODS - COMPACT SIZE (نصف ارتفاع)
  // ======================================================

  /// نمایش Toast موفقیت (سبز) با سایز کوچک - مطابق SVG
  static void showCompactSuccess({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.success,
      iconColor:const Color(AppColors.green600) ,
      primaryColor: const Color(AppColors.green900),
      backgroundColor: const Color(AppColors.green50),
      borderColor: const Color(AppColors.green600),
      context: context,
      duration: duration,
      size: ToastSize.compact,
    );
  }

  /// نمایش Toast خطا (قرمز) با سایز کوچک - مطابق SVG
  static void showCompactError({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.error,
      iconColor:const Color(AppColors.red600) ,
      primaryColor: const Color(AppColors.red900),
      backgroundColor: const Color(AppColors.red50),
      borderColor: const Color(AppColors.red600),
      context: context,
      duration: duration,
      size: ToastSize.compact,
    );
  }

  /// نمایش Toast خطا (قرمز) با سایز کوچک - نسخه دوم
  static void showCompactErrorDark({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.error,
      iconColor:const Color(AppColors.red600) ,
      primaryColor: const Color(AppColors.red900),
      backgroundColor: const Color(AppColors.red50),
      borderColor: const Color(AppColors.red600),
      context: context,
      duration: duration,
      size: ToastSize.compact,
    );
  }

  /// نمایش Toast هشدار (نارنجی) با سایز کوچک - مطابق SVG
  static void showCompactWarning({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.warning,
      iconColor:const Color(AppColors.brand600) ,
      primaryColor: const Color(AppColors.brand900),
      backgroundColor: const Color(AppColors.brand50),
      borderColor: const Color(AppColors.brand600),
      context: context,
      duration: duration,
      size: ToastSize.compact,
    );
  }

  /// نمایش Toast هشدار (نارنجی) با سایز کوچک - نسخه دوم
  static void showCompactWarningDark({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.warning,
      iconColor:const Color(AppColors.brand600) ,
      primaryColor: const Color(AppColors.brand900),
      backgroundColor: const Color(AppColors.brand50),
      borderColor: const Color(AppColors.brand600),
      context: context,
      duration: duration,
      size: ToastSize.compact,
    );
  }

  /// نمایش Toast اطلاعات (آبی) با سایز کوچک - مطابق SVG
  static void showCompactInfo({
    required String title,
    String? description,
    BuildContext? context,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showToast(
      title: title,
      description: description,
      type: ToastificationType.info,
      iconColor:const Color(AppColors.sky600) ,
      primaryColor: const Color(AppColors.sky900),
      backgroundColor: const Color(AppColors.sky50),
      borderColor: const Color(AppColors.sky600),
      context: context,
      duration: duration,
      size: ToastSize.compact,
    );
  }

  /// پاک کردن همه Toast‌ها
  static void dismissAll() {
    toastification.dismissAll();
  }
}

class ClosedButtonWidget extends StatelessWidget {
  final Color color;
  final IconData icon;

  const ClosedButtonWidget({
    super.key,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // onPressed مستقیماً از parent (ToastCloseButton) می‌آید
          },
          customBorder: const CircleBorder(),
          splashColor: color.withOpacity(0.2),
          highlightColor: color.withOpacity(0.1),
          child: Container(
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: 16,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

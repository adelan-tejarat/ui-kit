import 'dart:math' show pi, cos, sin;

import 'package:flutter/material.dart';
import 'package:vamstreet_components/src/core/constants/dimens.dart';
import 'package:vamstreet_components/src/core/themes/app_colors.dart';
import 'package:vamstreet_components/vamstreet_components.dart' show ButtonSize, AppTypography;

class VamstreetLoading extends StatefulWidget {
  final double size;
  final double strokeWidth;
  final Color color;
  final Duration duration;

  const VamstreetLoading({
    super.key,
    this.size = 24,
    this.strokeWidth = 2,
    this.color = const Color(AppColors.brand500),
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<VamstreetLoading> createState() => _VamstreetLoadingState();
}

class _VamstreetLoadingState extends State<VamstreetLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          painter: _IOSLoadingPainter(
            animation: _controller,
            strokeWidth: widget.strokeWidth,
            color: widget.color,
            size: widget.size,
          ),
        ),
      ),
    );
  }
}

class _IOSLoadingPainter extends CustomPainter {
  final Animation<double> animation;
  final double strokeWidth;
  final Color color;
  final double size;

  // کش کردن مقادیر ثابت برای جلوگیری از محاسبه مجدد
  late final int _dashCount;
  late final double _radius;
  late final double _innerRadiusFactor;
  late final double _minOpacity;
  late final double _maxOpacity;
  late final double _strokeWidthMultiplier;

  _IOSLoadingPainter({
    required this.animation,
    required this.strokeWidth,
    required this.color,
    required this.size,
  }) : super(repaint: animation) {
    // مقداردهی اولیه بر اساس size
    if (this.size <= 16) {
      _dashCount = 8;
      _radius = (size - strokeWidth) / 1.8;
      _innerRadiusFactor = 0.7;
      _minOpacity = 0.3;
      _maxOpacity = 1.0;
      _strokeWidthMultiplier = 1.1;
    } else if (this.size <= 20) {
      _dashCount = 10;
      _radius = (size - strokeWidth) / 2.0;
      _innerRadiusFactor = 0.75;
      _minOpacity = 0.2;
      _maxOpacity = 0.9;
      _strokeWidthMultiplier = 1.0;
    } else {
      _dashCount = 12;
      _radius = (size - strokeWidth) / 2.2;
      _innerRadiusFactor = 0.8;
      _minOpacity = 0.15;
      _maxOpacity = 0.85;
      _strokeWidthMultiplier = 0.9;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final progress = animation.value;

    // پیش‌محاسبه زاویه پایه
    final baseAngle = progress * 2 * pi;
    final angleStep = 2 * pi / _dashCount;

    // ایجاد Paint یکبار برای کل حلقه
    final dashPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < _dashCount; i++) {
      // محاسبه زاویه
      final angle = i * angleStep + baseAngle;

      // پیش‌محاسبه sin و cos برای زاویه
      final cosAngle = cos(angle);
      final sinAngle = sin(angle);

      // محاسبه موقعیت خط‌ها
      final outerX = center.dx + _radius * cosAngle;
      final outerY = center.dy + _radius * sinAngle;
      final innerX = center.dx + (_radius * _innerRadiusFactor) * cosAngle;
      final innerY = center.dy + (_radius * _innerRadiusFactor) * sinAngle;

      // محاسبه شفافیت - بهینه شده
      double angleDiff = (angle - baseAngle) % (2 * pi);
      if (angleDiff > pi) angleDiff = 2 * pi - angleDiff;

      final opacityFactor = 1 - (angleDiff / pi);
      double opacity = _minOpacity + (_maxOpacity * opacityFactor.clamp(0.0, 1.0));

      // تنظیم Paint
      dashPaint
        ..color = color.withOpacity(opacity.clamp(0.15, 1.0))
        ..strokeWidth = strokeWidth * _strokeWidthMultiplier;

      canvas.drawLine(
        Offset(outerX, outerY),
        Offset(innerX, innerY),
        dashPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _IOSLoadingPainter oldDelegate) {
    // بررسی تغییرات واقعی
    return oldDelegate.animation != animation ||
        oldDelegate.color != color ||
        (oldDelegate.strokeWidth - strokeWidth).abs() > 0.001 ||
        (oldDelegate.size - size).abs() > 0.001;
  }
}

// ======================================================
// ویجت لودینگ برای دکمه‌ها با اندازه‌های مختلف
// ======================================================

class ButtonLoading extends StatelessWidget {
  final ButtonSize size;
  final Color color;

  const ButtonLoading({
    super.key,
    required this.size,
    required this.color,
  });

  double _getLoadingSize() {
    switch (size) {
      case ButtonSize.md:
        return 16;
      case ButtonSize.lg:
        return 18;
      case ButtonSize.xlg:
        return 20;
    }
  }

  double _getStrokeWidth() {
    switch (size) {
      case ButtonSize.md:
        return 1.5;
      case ButtonSize.lg:
        return 1.8;
      case ButtonSize.xlg:
        return 2.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VamstreetLoading(
        size: _getLoadingSize(),
        strokeWidth: _getStrokeWidth(),
        color: color,
        duration: const Duration(milliseconds: 800),
      ),
    );
  }
}

// ======================================================
// ویجت لودینگ تمام صفحه
// ======================================================

class FullScreenLoading extends StatelessWidget {
  final String? message;
  final Color color;
  final double size;

  const FullScreenLoading({
    super.key,
    this.message,
    this.color = const Color(AppColors.brand500),
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(AppColors.white),
          borderRadius: BorderRadius.circular(Dimens.px16),
          boxShadow: [
            BoxShadow(
              color: const Color(AppColors.neutral900).withOpacity(0.1),
              blurRadius: Dimens.px20,
              offset: const Offset(0, Dimens.px4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.px24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VamstreetLoading(
                size: size,
                color: color,
                strokeWidth: 3,
              ),
              if (message != null) ...[
                const SizedBox(height: Dimens.px16),
                Text(
                  message!,
                  style: AppTypography.textTheme.bodyMedium?.copyWith(
                    color: const Color(AppColors.neutral700),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
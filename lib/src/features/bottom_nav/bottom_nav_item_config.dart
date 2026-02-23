import 'package:flutter/material.dart';
import 'bottom_nav_item_type.dart';

class BottomNavItemConfig {
  final BottomNavItemType type;
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final Color activeColor;
  final Color inactiveColor;

  const BottomNavItemConfig({
    required this.type,
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.activeColor,
    required this.inactiveColor,
  });
}

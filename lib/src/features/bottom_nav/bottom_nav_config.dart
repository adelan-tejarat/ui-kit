import 'package:flutter/material.dart';
import 'bottom_nav_item_type.dart';
import 'bottom_nav_item_config.dart';

class BottomNavConfig {
  static const Color backgroundColor = Color(0xFFF4EBDD);
  static const Color centerButtonColor = Color(0xFFC58B2B);
  static const Color inactiveColor = Color(0xFF8E8E93);

  static const List<BottomNavItemConfig> items = [
    BottomNavItemConfig(
      type: BottomNavItemType.profile,
      label: "پروفایل",
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      activeColor: centerButtonColor,
      inactiveColor: inactiveColor,
    ),
    BottomNavItemConfig(
      type: BottomNavItemType.services,
      label: "خدمات ما",
      icon: Icons.shopping_bag_outlined,
      activeIcon: Icons.shopping_bag,
      activeColor: centerButtonColor,
      inactiveColor: inactiveColor,
    ),
    BottomNavItemConfig(
      type: BottomNavItemType.wallet,
      label: "کیف پول",
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet,
      activeColor: centerButtonColor,
      inactiveColor: inactiveColor,
    ),

    BottomNavItemConfig(
      type: BottomNavItemType.settings,
      label: "تنظیمات",
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
      activeColor: centerButtonColor,
      inactiveColor: inactiveColor,
    ),

    BottomNavItemConfig(
      type: BottomNavItemType.barcode,
      label: "بارکد",
      icon: Icons.qr_code_scanner,
      activeIcon: Icons.qr_code_scanner,
      activeColor: centerButtonColor,
      inactiveColor: inactiveColor,
    ),
  ];

  static List<BottomNavItemConfig> get visibleItems =>
      items.where((item) => item.type != BottomNavItemType.barcode).toList();
}

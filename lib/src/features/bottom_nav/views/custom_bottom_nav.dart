import 'package:flutter/material.dart';
import '../bottom_nav_config.dart';
 import '../bottom_nav_item_config.dart';
import '../bottom_nav_item_type.dart';

class CustomBottomNav extends StatelessWidget {
  final BottomNavItemType currentTab;
  final ValueChanged<BottomNavItemType> onChanged;

  const CustomBottomNav({
    super.key,
    required this.currentTab,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = BottomNavConfig.visibleItems;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: BottomNavConfig.backgroundColor,
        elevation: 12,
        padding: EdgeInsets.zero, // حذف padding پیش‌فرض
        child: SizedBox(
          height: 70, // کمی کاهش ارتفاع
          child: Row(
            children: [
              for (int i = 0; i < navItems.length; i++) ...[
                if (i == navItems.length ~/ 2) const Spacer(),
                _buildItem(navItems[i]),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BottomNavItemConfig item) {
    final isSelected = currentTab == item.type;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: item.activeColor.withOpacity(0.2),
            highlightColor: item.activeColor.withOpacity(0.1),
            onTap: () => onChanged(item.type),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isSelected ? item.activeIcon : item.icon,
                    color: isSelected ? item.activeColor : item.inactiveColor,
                    size: 22, // کمی کوچکتر
                  ),
                  const SizedBox(height: 2), // کاهش فاصله
                  Flexible(
                    child: Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10, // کاهش سایز
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: isSelected ? item.activeColor : item.inactiveColor,
                        height: 1.2, // کاهش ارتفاع خط
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

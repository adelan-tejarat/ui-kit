enum BottomNavItemType {
  profile,
  settings,
  wallet,
  services,
  barcode;

  String get title {
    switch (this) {
      case BottomNavItemType.profile:
        return "پروفایل";
      case BottomNavItemType.settings:
        return "تنظیمات";
      case BottomNavItemType.wallet:
        return "کیف پول";
      case BottomNavItemType.services:
        return "خدمات ما";
      case BottomNavItemType.barcode:
        return "بارکد";
    }
  }
}

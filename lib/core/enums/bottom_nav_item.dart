enum BottomNavItem { countries, disconnect, settings }

extension BottomNavItemExtension on BottomNavItem {
  String get label {
    switch (this) {
      case BottomNavItem.countries:
        return 'Countries';
      case BottomNavItem.disconnect:
        return 'Disconnect';
      case BottomNavItem.settings:
        return 'Settings';
    }
  }

  String get assetPath {
    switch (this) {
      case BottomNavItem.countries:
        return 'assets/icons/countries.svg';
      case BottomNavItem.disconnect:
        return 'assets/icons/disconnect.svg';
      case BottomNavItem.settings:
        return 'assets/icons/setting.svg';
    }
  }
}

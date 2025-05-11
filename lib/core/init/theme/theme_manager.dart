import 'package:flutter/material.dart';
import 'package:vpn_case/core/init/theme/app_colors.dart';

// örneklerden oluşur özelleştirilebilir dinamik tema sağlamak için yapılmıştır
abstract class ThemeManager {
  static ThemeManager of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? LightModeTheme() : DarkModeTheme();
  }

  Color get primary1;
  Color get secondary1;
}

class LightModeTheme extends ThemeManager {
  @override
  Color primary1 = AppColors.primaryBlue;
  @override
  Color secondary1 = AppColors.backgroundColor;
}

class DarkModeTheme extends ThemeManager {
  @override
  Color primary1 = AppColors.backgroundColor;
  @override
  Color secondary1 = AppColors.darkBackground;
}

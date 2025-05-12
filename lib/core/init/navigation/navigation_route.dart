import 'package:flutter/material.dart';
import 'package:vpn_case/core/constants/navigation/navigations_constanst.dart';
import 'package:vpn_case/features/disconnect/disconnect_screen.dart';
import 'package:vpn_case/features/home/home_page.dart';
import 'package:vpn_case/features/setting/settings_screen.dart'
    show SettingsScreen;
import 'package:vpn_case/main.dart';

/**
 * buradaki MyApp  sayfası koyulması  hata verilmemesi için sayfalar oluşturulunca düzenlenecektir 
 */
class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const MyApp(), NavigationConstants.DEFAULT);

      case NavigationConstants.HOME:
        return normalNavigate(VpnHomeScreen(), NavigationConstants.HOME);

      case NavigationConstants.DISCONNECT:
        return normalNavigate(
          const DisconnectScreen(),
          NavigationConstants.DISCONNECT,
        );

      case NavigationConstants.SETTING:
        return normalNavigate(const SettingsScreen(), NavigationConstants.HOME);

      default:
        return MaterialPageRoute(builder: (context) => const MyApp());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }
}

// argumanlı gönderme örneği
 // case NavigationConstants.HOME:
      //   if (args.arguments is SettingsDynamicModel) {
      //     return normalNavigate(
      //       SettingsDynam icView(model: args.arguments as SettingsDynamicModel),
      //       NavigationConstants.HOME,
      //     );
      //   }
      //   throw NavigateException<SettingsDynamicModel>(args.arguments);
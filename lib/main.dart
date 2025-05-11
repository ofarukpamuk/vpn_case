import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vpn_case/core/constants/app/app_constants.dart';
import 'package:vpn_case/core/init/languages/language_manager.dart';
import 'package:vpn_case/core/init/navigation/navigation_route.dart';
import 'package:vpn_case/core/init/navigation/navigation_service.dart';
import 'package:vpn_case/core/init/theme/theme_config.dart';
import 'package:vpn_case/features/home/home_page.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
      startLocale: LanguageManager.instance.trLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: ThemeMode.system,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: VpnHomeScreen(),
    );
  }
}

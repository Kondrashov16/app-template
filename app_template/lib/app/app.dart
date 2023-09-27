import 'package:flutter/material.dart';

import 'pages/item_details/item_details_view.dart';
import 'pages/home/home_page_view.dart';
import 'pages/settings/bloc/settings_controller.dart';
import 'pages/settings/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',

          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Settings.routeName:
                    return Settings(controller: settingsController);
                  case ItemDetails.routeName:
                    return const ItemDetails();
                  case HomePage.routeName:
                  default:
                    return const HomePage();
                }
              },
            );
          },
        );
      },
    );
  }
}

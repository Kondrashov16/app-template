import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../pages/home/home_page_view.dart';
import '../../pages/item_details/item_details_view.dart';
import '../view/settings_service.dart';
import '../../pages/settings/bloc/settings_controller.dart';
import '../../pages/settings/settings_view.dart';

class AppRouter {
  final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'item_details',
            builder: (BuildContext context, GoRouterState state) {
              return const ItemDetails();
            },
          ),
          GoRoute(
            path: 'settings',
            builder: (BuildContext context, GoRouterState state) {
              return Settings(
                  controller: SettingsController(SettingsService()));
            },
          ),
        ],
      ),
    ],
  );
}

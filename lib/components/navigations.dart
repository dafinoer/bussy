import 'package:bussy/ui/home/home_screen_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../ui/root/root_screen_page.dart';
import '../ui/search/search_screen_page.dart';

final GlobalKey<NavigatorState> _rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavKey = GlobalKey<NavigatorState>();

final route = GoRouter(
  navigatorKey: _rootNavKey,
  initialLocation: HomeScreenPage.route,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavKey,
      builder: (context, state, child) {
        return RootScreenPage(child: child);
      },
      routes: [
        GoRoute(
          path: HomeScreenPage.route,
          pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreenPage()),
        ),
        GoRoute(
          path: SearchScreenPage.route,
          pageBuilder: (context, state) => const NoTransitionPage(child: SearchScreenPage()),
        ),
      ],
    ),
  ],
);

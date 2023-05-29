import 'package:bussy/domains/model/filter_model.dart';
import 'package:bussy/ui/filter/filter_screen_page.dart';
import 'package:bussy/ui/home/home_screen_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../ui/detail/detail_screen_page.dart';

final route = GoRouter(
  initialLocation: HomeScreenPage.route,
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: HomeScreenPage.route,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomeScreenPage()),
    ),
    GoRoute(
      path: '/filter',
      builder: (context, state) {
        final filter = state.extra as Map<String, FilterModel>?;

        return FilterScreenPage(filters: filter);
      },
    ),
    GoRoute(
      path: '${DetailScreenPage.route}/:userId',
      builder: (context, state) =>
          DetailScreenPage(id: state.pathParameters['userId']!),
    ),
  ],
);

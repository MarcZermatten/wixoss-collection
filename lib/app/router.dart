import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/catalog/presentation/pages/catalog_page.dart';
import '../features/catalog/presentation/pages/card_detail_page.dart';
import '../features/collection/presentation/pages/collection_page.dart';
import '../features/wishlist/presentation/pages/wishlist_page.dart';
import '../features/stats/presentation/pages/stats_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../shared/widgets/main_scaffold.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/catalog',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          // Catalog tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/catalog',
                builder: (context, state) => const CatalogPage(),
                routes: [
                  GoRoute(
                    path: 'card/:id',
                    builder: (context, state) => CardDetailPage(
                      cardId: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Collection tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/collection',
                builder: (context, state) => const CollectionPage(),
              ),
            ],
          ),
          // Wishlist tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wishlist',
                builder: (context, state) => const WishlistPage(),
              ),
            ],
          ),
          // Stats tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/stats',
                builder: (context, state) => const StatsPage(),
              ),
            ],
          ),
          // Settings tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

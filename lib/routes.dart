import 'package:giggle_grid/views/random_jokes_view.dart';
import 'package:go_router/go_router.dart';

import 'common/bottom_navigation.dart';
import 'views/categories_view.dart';
import 'views/favourites_view.dart';
import 'views/search_view.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: bottomNavigationBuilder,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const CategoriesView(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavouritesView(),
        ),
        GoRoute(
            path: '/joke/:category',
            builder: (context, state) {
              final String category = state.pathParameters['category']!;
              return RandomJokesView(category);
            }),
      ],
    ),
  ],
);

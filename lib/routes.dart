import 'package:flutter/material.dart';
import 'package:giggle_grid/views/random_jokes_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'views/categories_view.dart';
import 'views/favourites_view.dart';
import 'views/search_view.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const GNav(
            tabs: [
              GButton(
                icon: Icons.list,
                text: "Categories",
              ),
              GButton(
                icon: Icons.search_rounded,
                text: "Search",
              ),
              GButton(
                icon: Icons.favorite,
                text: "Favourite",
              )
            ],
          ),
        );
      },
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

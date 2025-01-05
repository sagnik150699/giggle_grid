import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/categories_random_joke_view_model.dart';
import '../view_model/favourites_view_model.dart';
import '../view_model/search_view_model.dart';

final categoriesRandomJokeViewModelProvider =
    ChangeNotifierProvider.autoDispose<CategoriesRandomJokeViewModel>(
        (ref) => CategoriesRandomJokeViewModel());

final favoritesViewModelProvider =
    ChangeNotifierProvider.autoDispose<FavoritesViewModel>(
        (ref) => FavoritesViewModel());

final searchViewModelProvider =
    ChangeNotifierProvider.autoDispose<SearchViewModel>(
  (ref) => SearchViewModel(),
);

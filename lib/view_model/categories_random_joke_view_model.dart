import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giggle_grid/services/api_services.dart';
import 'package:giggle_grid/services/jokes_local_storage_services.dart';

import '../common/logger.dart';
import '../models/models.dart';

final categoriesRandomJokeViewModelProvider =
    ChangeNotifierProvider.autoDispose<CategoriesRandomJokeViewModel>(
        (ref) => CategoriesRandomJokeViewModel());

class CategoriesRandomJokeViewModel extends ChangeNotifier {
  List<CategoryModel> categories = [];
  bool isLoading = false;
  final ApiService api = ApiService();
  String errorMessage = '';
  RandomJokeModel? randomJoke;
  String selectedCategory = '';
  final JokesDatabase _jokesDb = JokesDatabase();

  CategoriesRandomJokeViewModel() {
    fetchCategories(); // Initial Fetch
  }

  void selectedCategoryUpdate(String selectCategory) {
    selectedCategory = selectCategory;
    notifyListeners();
  }

  // Function to fetch categories
  Future<void> fetchCategories() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      errorMessage = "No internet connection";
      isLoading = false;
      notifyListeners();
      return;
    } else {
      try {
        final response = await api.fetchCategories();

        if (response.statusCode == 200) {
          categories = (response.data as List)
              .map((json) => CategoryModel.fromJson(json))
              .toList();
          logger.d(categories);
        } else {
          errorMessage = 'Failed to Load categories';
          logger.d(errorMessage);
        }
      } catch (e) {
        errorMessage = e.toString();
        logger.d(errorMessage);
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }

// Function to fetch random joke by category
  Future<void> fetchRandomJoke() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      errorMessage = "No internet connection";
      isLoading = false;
      notifyListeners();
      return;
    } else {
      try {
        final response = await api.fetchRandomByCategories(selectedCategory);

        if (response.statusCode == 200) {
          randomJoke = RandomJokeModel.fromJson(response.data);
          logger.d(randomJoke);
        } else {
          errorMessage = 'Failed to Load categories';
          logger.d(errorMessage);
        }
      } catch (e) {
        errorMessage = e.toString();
        logger.d(errorMessage);
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }

  void likeJoke() {
    if (randomJoke == null) return;
    _jokesDb.likeJoke(randomJoke!.id, randomJoke!.value);
    notifyListeners();
  }

  void unlikeJoke() {
    if (randomJoke == null) return;
    _jokesDb.unlikeJoke(randomJoke!.id);
    notifyListeners();
  }

  bool isJokeLiked() {
    return randomJoke != null && _jokesDb.isJokeLiked(randomJoke!.id);
  }
}

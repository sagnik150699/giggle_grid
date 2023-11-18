import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giggle_grid/services/api_services.dart';

import '../common/logger.dart';
import '../models/models.dart';

final categoriesViewModelProvider =
    ChangeNotifierProvider.autoDispose<CategoriesViewModel>(
        (ref) => CategoriesViewModel());

class CategoriesViewModel extends ChangeNotifier {
  List<Category> categories = [];
  bool isLoading = false;
  final ApiService api = ApiService();
  String errorMessage = '';

  CategoriesViewModel() {
    fetchCategories(); // Initial Fetch
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
    }

    try {
      final response = await api.fetchCategories();

      if (response.statusCode == 200) {
        categories = (response.data as List)
            .map((json) => Category.fromJson(json))
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

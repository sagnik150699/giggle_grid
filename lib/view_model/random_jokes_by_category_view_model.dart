import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/logger.dart';
import '../models/models.dart';
import '../services/api_services.dart';

final randomJokesByCategoryViewModelProvider =
    ChangeNotifierProvider.autoDispose<RandomJokesByCategory>(
        (ref) => RandomJokesByCategory());

class RandomJokesByCategory extends ChangeNotifier {
  bool isLoading = false;
  final ApiService api = ApiService();
  String errorMessage = '';
  RandomJokeModel? randomJoke;

  void init(String category) {
    fetchRandomJoke(category);
  }

  Future<void> fetchRandomJoke(String category) async {
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
        final response = await api.fetchRandomByCategories(category);

        if (response.statusCode == 200) {
          randomJoke = RandomJokeModel.fromJson(response.data);
          //logger.d(randomJoke);
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
}

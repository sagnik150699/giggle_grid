import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';
import '../services/api_services.dart';
import '../services/jokes_local_storage_services.dart';

final searchViewModelProvider =
    ChangeNotifierProvider.autoDispose<SearchViewModel>(
  (ref) => SearchViewModel(),
);

class SearchViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final JokesDatabase _jokesDb = JokesDatabase();
  List<SearchJokeModel> searchResults = [];
  bool isLoading = false;
  String errorMessage = '';
  Future<void> searchJokes(String query) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      errorMessage = "No internet connection";
      isLoading = false;
      notifyListeners();
      return;
    } else if (query=="") {
      errorMessage = 'Please Type';
      isLoading = false;
      notifyListeners();
      return;
    } else {
      try {
        final response = await _apiService.searchJokes(query);
        final List<dynamic> results = response.data['result'];
        searchResults = results
            .map((jokeJson) =>
                SearchJokeModel.fromJson(jokeJson as Map<String, dynamic>))
            .toList();
      } catch (e) {
        errorMessage = "Failed to fetch jokes. Please try again.";
        searchResults = [];
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }

  bool isJokeLiked(String id) {
    return _jokesDb.isJokeLiked(id);
  }

  void toggleJokeLikeStatus(SearchJokeModel joke) {
    if (isJokeLiked(joke.id)) {
      _jokesDb.unlikeJoke(joke.id);
    } else {
      _jokesDb.likeJoke(joke.id, joke.value);
    }
    notifyListeners();
  }
}

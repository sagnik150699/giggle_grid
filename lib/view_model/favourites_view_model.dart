import 'package:flutter/material.dart';

import '../services/jokes_local_storage_services.dart';

class FavoritesViewModel extends ChangeNotifier {
  final JokesDatabase _jokesDb = JokesDatabase();
  List<Map<String, String>> likedJokes = [];

  FavoritesViewModel() {
    loadLikedJokes();
  }

  void loadLikedJokes() {
    likedJokes = _jokesDb.loadLikedJokes();
    notifyListeners();
  }

  bool isJokeLiked(String id) {
    return likedJokes.any((joke) => joke['id'] == id);
  }

  void unlikeJoke(String id) {
    _jokesDb.unlikeJoke(id);
    loadLikedJokes();
  }
}

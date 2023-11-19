import 'package:hive/hive.dart';

class JokesDatabase {
  final _jokesBox = Hive.box('jokesBox');

  List<Map<String, String>> loadLikedJokes() {
    var rawJokes =
        _jokesBox.get('likedJokes', defaultValue: <Map<String, String>>[]);
    if (rawJokes is List<Map<String, String>>) {
      return rawJokes;
    } else {
      // Convert each element to Map<String, String>
      return List<Map<String, String>>.from(
        rawJokes.map((item) => Map<String, String>.from(item as Map)),
      );
    }
  }

  // Save a liked joke
  void likeJoke(String id, String joke) {
    var likedJokes = loadLikedJokes();
    likedJokes.add({'id': id, 'joke': joke});
    _jokesBox.put('likedJokes', likedJokes);
  }

  // Unlike a joke
  void unlikeJoke(String id) {
    var likedJokes = loadLikedJokes();
    likedJokes.removeWhere((joke) => joke['id'] == id);
    _jokesBox.put('likedJokes', likedJokes);
  }

  // Check if a joke is liked
  bool isJokeLiked(String id) {
    var likedJokes = loadLikedJokes();
    return likedJokes.any((joke) => joke['id'] == id);
  }
}

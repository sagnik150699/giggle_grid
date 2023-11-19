import 'package:dio/dio.dart';

class ApiService {
  var dio = Dio();

  Future fetchCategories() async {
    var response = await dio.get('https://api.chucknorris.io/jokes/categories');
    return response;
  }

  Future fetchRandomByCategories(String jokeCategory) async {
    var response = await dio
        .get("https://api.chucknorris.io/jokes/random?category=$jokeCategory");
    return response;
  }

  Future<Response> searchJokes(String query) async {
    return await dio
        .get('https://api.chucknorris.io/jokes/search?query=$query');
  }
}

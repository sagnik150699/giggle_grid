import 'package:dio/dio.dart';

class ApiService {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.chucknorris.io',
    ),
  );

  Future fetchCategories() async {
    var response = await dio.get('/jokes/categories');
    return response;
  }

  Future fetchRandomByCategories(String jokeCategory) async {
    var response = await dio.get("/jokes/random?category=$jokeCategory");
    return response;
  }

  Future<Response> searchJokes(String query) async {
    return await dio.get('/jokes/search?query=$query');
  }
}

import 'package:dio/dio.dart';

class ApiService {
  var dio = Dio();

  Future fetchCategories() async {
    var response = await dio.get('https://api.chucknorris.io/jokes/categories');
    return response;
  }
}

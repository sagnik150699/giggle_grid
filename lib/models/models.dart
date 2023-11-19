

class CategoryModel {
  final String name;

  CategoryModel({required this.name});

  factory CategoryModel.fromJson(String json) {
    return CategoryModel(name: json);
  }
}

class RandomJokeModel {
  final String id;
  final String value;

  RandomJokeModel({required this.id, required this.value});

  factory RandomJokeModel.fromJson(Map<String, dynamic> json) {
    return RandomJokeModel(
      id: json['id'] as String,
      value: json['value'] as String,
    );
  }
}

class JokeHiveModel {
  late String id;
  late String joke;

  JokeHiveModel({required this.id, required this.joke});
}

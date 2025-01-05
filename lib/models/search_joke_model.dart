class SearchJokeModel {
  final String id;
  final String value;

  SearchJokeModel({required this.id, required this.value});

  factory SearchJokeModel.fromJson(Map<String, dynamic> json) {
    return SearchJokeModel(
      id: json['id'] as String,
      value: json['value'] as String,
    );
  }
}

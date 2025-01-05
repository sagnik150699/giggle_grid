class CategoryModel {
  final String name;

  CategoryModel({required this.name});

  factory CategoryModel.fromJson(String json) {
    return CategoryModel(name: json);
  }
}

class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(String json) {
    return Category(name: json);
  }
}

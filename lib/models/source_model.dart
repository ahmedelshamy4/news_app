class SourceModel {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  SourceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
  });
  factory SourceModel.fromJson(Map<String, dynamic> jsonData) {
    return SourceModel(
      id: jsonData['id'] ?? '',
      name: jsonData['name'] ?? '',
      description: jsonData['description'] ?? '',
      url: jsonData['url'] ?? '',
      category: jsonData['category'] ?? '',
    );
  }

  @override
  String toString() {
    return 'SourceModel(id: $id, name: $name, description: $description, url: $url, category: $category)';
  }
}

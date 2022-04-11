import 'package:news_app/models/source_model.dart';

class ArticleModel {
  final SourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> jsonData) {
    return ArticleModel(
      source: SourceModel.fromJson(jsonData['source'] ?? ''),
      author: jsonData['author'] ?? '',
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? '',
      url: jsonData['url'] ?? '',
      urlToImage: jsonData['urlToImage'] ?? '',
      publishedAt: DateTime.parse(jsonData['publishedAt'] ?? ''),
      content: jsonData['content'] ?? '',
    );
  }

  @override
  String toString() {
    return 'NewModel(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }
}

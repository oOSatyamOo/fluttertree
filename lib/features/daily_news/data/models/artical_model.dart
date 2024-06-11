import '../../domain/entities/artical_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> js) {
    return ArticleModel(
      id: null,
      author: js['author'] ?? '',
      title: js['title'] ?? '',
      description: js['description'] ?? '',
      url: js['url'] ?? '',
      urlToImage: js['urlToImage'],
      publishedAt: js['publishedAt'] ?? '',
      content: js['content'] ?? '',
    );
  }
}

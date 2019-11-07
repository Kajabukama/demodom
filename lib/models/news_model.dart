import 'dart:convert';
import 'package:demodom/models/articles.dart';

Article postFromJson(String str) {
  final jsonData = json.decode(str);
  return Article.fromJson(jsonData);
}

List<Article> allArticlesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Article>.from(jsonData.map((x) => Article.fromJson(x)));
}

class Article {
  final String status;
  final String totalResults;
  final List<ArticleNews> articles;

  Article({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    print(list.runtimeType);
    List<ArticleNews> articles =
        list.map((i) => ArticleNews.fromJson(i)).toList();

    return Article(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
    );
  }
}

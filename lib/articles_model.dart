import 'dart:convert';

import 'package:simple_news_app/news_model.dart';

class ArticlesModel {
  Source? source;
  String? author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime? publishedAt;
  String content;
  ArticlesModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: DateTime.tryParse(json['publishedAt']),
        content: json['content'],
      );
}

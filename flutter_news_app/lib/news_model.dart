import 'dart:math';

import 'package:flutter_news_app/category_model.dart';

class Comment {
  final String author;
  final DateTime date;
  final String text;

  Comment({required this.author, required this.date, required this.text});

  // to json
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'date': date.toIso8601String(),
      'text': text,
    };
  }
}

class News {
  int id = Random().nextInt(10000);
  Category? category;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final DateTime publishedAt;
  final String url;
  bool isFeatured;
  List<Comment>? comments;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.urlToImage,
      required this.publishedAt,
      required this.url,
      this.isFeatured = false,
      this.category,
      this.comments});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt']),
      url: json['url'] ?? '',
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toIso8601String(),
      'url': url,
      'isFeatured': isFeatured,
      'comments': comments?.map((comment) => comment.toJson()).toList(),
    };
  }
}

// list of news
Map<String, dynamic> newsMap = {'all': {}};

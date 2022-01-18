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
  bool isFeatured;
  List<Comment>? comments;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.urlToImage,
      required this.publishedAt,
      this.isFeatured = false,
      this.category,
      this.comments});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']),
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
      'isFeatured': isFeatured,
      'comments': comments?.map((comment) => comment.toJson()).toList(),
    };
  }
}

// list of news
List<News> newsList = [
  News(
    author: 'Bill Gates',
    title: 'A Clean Industrial Revolution Is the Only Way to Hit Net Zero',
    description:
        'Governments and companies around the world are finally acting to create a green economy and avoid climate catastrophe.',
    urlToImage:
        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    publishedAt: DateTime.now().subtract(const Duration(days: 1)),
    category: categories[0],
  ),
  News(
    author: 'Robert Smith',
    title: 'The New Economy Is the Future of the World',
    description:
        'The new economy is the future of the world. It is the future of the world. It is the future of the world.',
    urlToImage:
        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
    category: categories[1],
  ),
  News(
    author: 'Mark Zuckerberg',
    title: 'Facebook Is the Future of the Internet',
    description:
        'Facebook is the future of the internet. Facebook is the future of the internet. Facebook is the future of the internet.',
    urlToImage:
        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    publishedAt: DateTime.now().subtract(const Duration(hours: 10)),
    category: categories[1],
  ),
  News(
    author: 'Jack Ma',
    title: 'Alibaba Is the Future of the Internet',
    description:
        'Alibaba is the future of the internet. Alibaba is the future of the internet. Alibaba is the future of the internet.',
    urlToImage:
        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
    category: categories[2],
  ),
  News(
    author: 'Jack Ma',
    title: 'Alibaba Is the Future of the Internet',
    description:
        'Alibaba is the future of the internet. Alibaba is the future of the internet. Alibaba is the future of the internet.',
    urlToImage:
        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
    category: categories[2],
    isFeatured: true,
  ),
];

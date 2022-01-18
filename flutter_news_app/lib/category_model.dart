import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color color;

  const Category({
    required this.name,
    required this.color,
  });

  // from json
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      color: Color(json['color'] as int),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'color': color.value,
    };
  }
}

const List<Category> categories = [
  Category(
    name: 'business',
    color: Color(0xFFFFC107),
  ),
  Category(
    name: 'entertainment',
    color: Color(0xFFF44336),
  ),
  Category(
    name: 'general',
    color: Color(0xFFE91E63),
  ),
  Category(
    name: 'technology',
    color: Color(0xFF9C27B0),
  ),
  Category(
    name: 'science',
    color: Color(0xFF673AB7),
  ),
  Category(
    name: 'sports',
    color: Color(0xFF3F51B5),
  ),
];

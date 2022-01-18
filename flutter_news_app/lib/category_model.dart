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
    name: 'Economic',
    color: Color(0xFFFFC107),
  ),
  Category(
    name: 'Social',
    color: Color(0xFFF44336),
  ),
  Category(
    name: 'Political',
    color: Color(0xFFE91E63),
  ),
  Category(
    name: 'Cultural',
    color: Color(0xFF9C27B0),
  ),
  Category(
    name: 'Sports',
    color: Color(0xFF673AB7),
  ),
];

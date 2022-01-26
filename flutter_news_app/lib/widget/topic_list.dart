import 'package:flutter/material.dart';

import '../category_model.dart';

class TopicList extends StatelessWidget {
  const TopicList({
    Key? key,
    required this.category,
    required this.changeCategory,
  }) : super(key: key);

  final List<Category> category;
  final Function changeCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return MaterialButton(
            minWidth: 100,
            shape: const StadiumBorder(),
            color: category[index].color,
            onPressed: () {
              changeCategory(category[index]);
            },
            child: Text(
              category[index].name,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

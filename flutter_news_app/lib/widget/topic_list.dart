import 'package:flutter/material.dart';

import '../category_model.dart';

class TopicList extends StatelessWidget {
  const TopicList(
      {Key? key,
      required this.categories,
      required this.changeCategory,
      required this.currentCategory})
      : super(key: key);

  final List<Category> categories;
  final Category? currentCategory;
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
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return MaterialButton(
            minWidth: 100,
            shape: const StadiumBorder(),
            color: currentCategory == categories[index]
                ? Colors.black
                : categories[index].color,
            onPressed: () {
              changeCategory(categories[index]);
            },
            child: Text(
              categories[index].name,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

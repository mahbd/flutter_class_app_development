import 'package:flutter/material.dart';

import '../news_detail.dart';
import '../news_model.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({
    Key? key,
    required this.news,
    required this.toggleFeatured,
  }) : super(key: key);

  final News news;
  final Function toggleFeatured;

  @override
  Widget build(BuildContext context) {
    Icon featuredIcon = news.isFeatured
        ? const Icon(Icons.star)
        : const Icon(Icons.star_border);
    return Card(
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color:
              news.category == null ? Colors.deepPurple : news.category!.color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetail(
                        news: news,
                        toggleFeatured: toggleFeatured,
                      ),
                    ),
                  ),
                  child: Text(
                    news.title,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(news.category?.name ?? 'Featured'),
                  IconButton(
                    icon: featuredIcon,
                    onPressed: () {
                      toggleFeatured();
                    },
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

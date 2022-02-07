import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import 'helpers.dart';
import 'news_detail.dart';
import 'news_model.dart';

class NewsList extends StatelessWidget {
  const NewsList(
      {Key? key, required this.newsList, required this.toggleFeatured})
      : super(key: key);
  final List<News> newsList;
  final Function toggleFeatured;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetail(
                      news: newsList[index],
                      toggleFeatured: () => toggleFeatured(newsList[index]),
                    ),
                  ),
                );
              },
              leading: Hero(
                tag: 'news_${newsList[index].id}',
                child: Image.network(newsList[index].urlToImage),
              ),
              title: Text(
                truncate(newsList[index].title),
                style: const TextStyle(fontSize: 16),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      newsList[index].author,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // time difference from now
                  Text(
                    newsList[index].publishedAt.relative(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:crypto/crypto.dart';

import 'category_model.dart';
import 'const.dart';
import 'helpers.dart';
import 'news_model.dart';
import 'news_detail.dart';
import 'widget/featured_news.dart';
import 'widget/search_widget.dart';
import 'widget/topic_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getNewsList(reload);
  }

  reload() {
    setState(() {});
  }

  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    List<News> featuredNews = [];
    List<News> newsList = [];
    if (selectedCategory != null) {
      if (newsMap.containsKey(selectedCategory!.name)) {
        for (News news in newsMap[selectedCategory!.name]) {
          if (news.isFeatured) {
            featuredNews.add(news);
          }
          newsList.add(news);
        }
      }
    } else {
      for (News news in newsMap['all'].values) {
        if (news.isFeatured) {
          featuredNews.add(news);
        }
        newsList.add(news);
      }
    }

    newsList.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    featuredNews.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));

    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchWidget(),
          SizedBox(
            height: 130,
            child: ListView.builder(
                itemCount: featuredNews.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FeaturedNews(
                    news: featuredNews[index],
                    toggleFeatured: () => toggleFeatured(featuredNews[index]),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 16, left: 10),
            child: Row(
              children: [
                const Text(
                  "Hot Topics",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = null;
                      });
                    },
                    child: const Text("See All"))
              ],
            ),
          ),
          TopicList(
            category: categories,
            changeCategory: changeCategory,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
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
                            toggleFeatured: () =>
                                toggleFeatured(newsList[index]),
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
          )
        ],
      ),
    );
  }

  toggleFeatured(News news) {
    news.isFeatured = !news.isFeatured;
    setState(() {});
  }

  void changeCategory(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}

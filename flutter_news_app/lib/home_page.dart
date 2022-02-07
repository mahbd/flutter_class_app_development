import 'package:flutter/material.dart';
import 'package:flutter_news_app/news_list.dart';

import 'category_model.dart';
import 'helpers.dart';
import 'news_model.dart';
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
  String searchText = '';

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
    } else if (searchText != '') {
      for (News news in newsMap['search'].values) {
        if (news.isFeatured) {
          featuredNews.add(news);
        }
        newsList.add(news);
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
          SearchWidget(updateSearchText: updateSearchText),
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
            categories: categories,
            changeCategory: changeCategory,
            currentCategory: selectedCategory,
          ),
          const SizedBox(
            height: 10,
          ),
          NewsList(newsList: newsList, toggleFeatured: toggleFeatured),
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
      searchText = '';
    });
  }

  void updateSearchText(String text) {
    setState(() {
      searchText = text;
      selectedCategory = null;
    });
    getSearchedNewsList(searchText, reload);
  }
}

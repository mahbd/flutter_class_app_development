import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'category_model.dart';
import 'const.dart';
import 'news_model.dart';
import 'news_detail.dart';

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

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5, top: 10),
      child: SizedBox(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:
                      BorderSide(width: 0.5, color: Colors.grey.shade500)),
              prefixIcon: const Icon(Icons.search)),
        ),
      ),
    );
  }
}

String hashString(String input) {
  var hasher = md5.convert(utf8.encode(input));
  return hasher.toString();
}

void getNewsList(reload) async {
  for (int i = 0; i < categories.length; i++) {
    String apiURL =
        "https://newsapi.org/v2/top-headlines?country=us&category=${categories[i].name}&apiKey=$apiKey&pageSize=10";
    final response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['articles'];
      for (int j = 0; j < jsonResponse.length; j++) {
        News news = News.fromJson(jsonResponse[j]);
        news.category = categories[i];
        news.isFeatured = Random().nextBool();
        String titleHash = hashString(news.title);
        if (newsMap.containsKey(news.category!.name)) {
          newsMap[news.category!.name].add(news);
          // generate hash for news title
        } else {
          newsMap[news.category!.name] = [news];
        }
        newsMap['all'][titleHash] = news;
      }
      reload();
    }
  }
}

String truncate(String str, [int size = 80]) {
  if (str.length > size) {
    return str.substring(0, size) + '...';
  }
  return str;
}

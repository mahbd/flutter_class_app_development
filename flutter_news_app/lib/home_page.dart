import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';

import 'category_model.dart';
import 'news_model.dart';
import 'news_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<News> featuredNews = [];
    for (int i = 0; i < newsList.length; i++) {
      if (newsList[i].isFeatured) {
        featuredNews.add(newsList[i]);
      }
    }

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
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 16, left: 10),
            child: Text(
              "Hot Topics",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const TopicList(category: categories),
          const SizedBox(
            height: 10,
          ),
          Expanded(
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
                            toggleFeatured: () =>
                                toggleFeatured(newsList[index]),
                          ),
                        ),
                      );
                    },
                    leading: Image.network(newsList[index].urlToImage),
                    title: Text(
                      newsList[index].title,
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(newsList[index].author),
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
}

class TopicList extends StatelessWidget {
  const TopicList({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List<Category> category;

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
            onPressed: () {},
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
              Text(
                news.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
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

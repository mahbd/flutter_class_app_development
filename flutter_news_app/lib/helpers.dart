import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'category_model.dart';
import 'const.dart';
import 'news_model.dart';

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

void getSearchedNewsList(String q, reload) async {
  newsMap['search'] = {};
  String apiURL =
      "https://newsapi.org/v2/everything?q=$q&apiKey=$apiKey&pageSize=10";
  final response = await http.get(Uri.parse(apiURL));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body)['articles'];
    for (int j = 0; j < jsonResponse.length; j++) {
      News news = News.fromJson(jsonResponse[j]);
      news.category = categories[0];
      news.isFeatured = Random().nextBool();
      String titleHash = hashString(news.title);
      newsMap['search'][titleHash] = news;
    }
    reload();
  }
}

String truncate(String str, [int size = 80]) {
  if (str.length > size) {
    return str.substring(0, size) + '...';
  }
  return str;
}

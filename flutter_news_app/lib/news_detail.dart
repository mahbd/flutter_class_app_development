import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter_news_app/news_model.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({Key? key, required this.news, required this.toggleFeatured})
      : super(key: key);
  final News news;
  final Function toggleFeatured;

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    Icon featuredIcon = widget.news.isFeatured
        ? const Icon(Icons.star)
        : const Icon(Icons.star_border);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width - 15,
              child: Hero(
                tag: 'news_${widget.news.id}',
                child: Image.network(widget.news.urlToImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Text(widget.news.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Text(
              widget.news.author,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(widget.news.publishedAt.format(DateTimeFormats.american),
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10),
                child: Column(
                  children: [
                    Text(
                      widget.news.description,
                      style: const TextStyle(fontSize: 17),
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: GestureDetector(
                        child: const Text('Read more here'),
                        onTap: () => _launchURL(widget.news.url),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: 200,
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.comment,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add a comment',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  color: Colors.lightBlue,
                  shape: const StadiumBorder(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {
                    widget.toggleFeatured();
                    setState(() {});
                  },
                  icon: featuredIcon,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}

import 'package:flutter/material.dart';

class NewsDescription extends StatelessWidget {
  const NewsDescription({Key? key, required this.newsId}) : super(key: key);
  final int newsId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text('Saturday 12th of December 2021.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Text('Economy',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const Text('How to redisgn 175 years old newspaper.',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Image.network(
              'https://picsum.photos/id/1/${MediaQuery.of(context).size.width.toInt() - 30}/200',
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Hello world. This is Bangladesh',
                  style: TextStyle(fontSize: 17),
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
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

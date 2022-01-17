import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List category = ['Economic', 'Social', 'Political', 'Cultural', 'Sports'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hi'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 16),
              child: Text(
                "Latest news",
                style: TextStyle(fontSize: 25, color: Colors.deepPurple),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                fillColor: Colors.grey,
                filled: true,
              ),
            ),
            SizedBox(
              height: 35,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                        minWidth: 80,
                        shape: const StadiumBorder(),
                        color: Colors.deepPurple,
                        onPressed: () {},
                        child: Text(
                          category[index],
                          style: const TextStyle(color: Colors.white),
                        ));
                  }),
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset('assets/images/logo.png'),
                  title: const Text(
                    'This is an example of news heading',
                  ),
                  subtitle: const Text('Author: Jack and Rose'),
                ),
              );
            }))
          ],
        ));
  }
}

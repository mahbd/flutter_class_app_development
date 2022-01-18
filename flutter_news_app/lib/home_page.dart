import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List category = ['Economic', 'Social', 'Political', 'Cultural', 'Sports'];
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 16, left: 10),
          child: Text(
            "Explore",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const SearchWidget(),
        const HeroWidget(),
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 16, left: 10),
          child: Text(
            "Hot Topics",
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        TopicList(category: category),
        Expanded(child: ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset('assets/images/logo.png'),
              title: const Text(
                'This is an example of news heading',
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Economy'),
                  Text('1w ago'),
                ],
              ),
            ),
          );
        }))
      ],
    ));
  }
}

class TopicList extends StatelessWidget {
  const TopicList({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return MaterialButton(
                minWidth: 150,
                shape: const StadiumBorder(),
                color: Colors.deepPurple,
                onPressed: () {},
                child: Text(
                  category[index],
                  style: const TextStyle(color: Colors.white),
                ));
          }),
    );
  }
}

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          child: Container(
            height: 125,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'This is an example hero card',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: const Text('Featured'),
                        color: Colors.purple,
                        shape: const StadiumBorder(),
                        height: 25,
                      ),
                      const Icon(
                        Icons.star_border_outlined,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
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
      padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
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

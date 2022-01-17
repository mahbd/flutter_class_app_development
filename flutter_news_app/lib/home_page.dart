import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List category = ['Economic', 'Social', 'Political', 'Cultural', 'Sports'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Column(
          children: [
            const Text("Latest news"),
            const TextField(),
            Container(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                        onPressed: () {}, child: Text("Button $index"));
                  }),
            )
          ],
        ));
  }
}

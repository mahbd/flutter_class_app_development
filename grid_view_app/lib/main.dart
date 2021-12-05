import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GridViewApp(),
    );
  }
}

class GridViewApp extends StatefulWidget {
  const GridViewApp({Key? key}) : super(key: key);

  @override
  _GridViewAppState createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            elevation: 10,
            shadowColor: Colors.green,
            child: Stack(
              children: [
                Container(child: Image.asset('')),
                Container(child: Image.network(''),)
              ],
            ),
          );
        },
      ),
    );
  }
}

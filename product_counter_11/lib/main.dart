import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CountingNumber());
  }
}

class CountingNumber extends StatefulWidget {
  const CountingNumber({Key? key}) : super(key: key);

  @override
  _CountingNumberState createState() => _CountingNumberState();
}

class _CountingNumberState extends State<CountingNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counting Number'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.red,
                    size: 30,
                  )),
              const Text('  '),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 30, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}

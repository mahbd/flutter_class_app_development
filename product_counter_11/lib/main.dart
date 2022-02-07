import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

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
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Counting Number'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
            child: _counter > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Decrease the num',
                          style: TextStyle(fontSize: 20)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _counter > 0 ? _counter-- : _counter = 0;
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.red,
                            size: 30,
                          )),
                    ],
                  )
                : const Center(
                    child: Text('Minimum Limit Reached',
                        style: TextStyle(fontSize: 20)),
                  ),
          ),
          Container(
            child: _counter <= 10
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Increase the num',
                          style: TextStyle(fontSize: 20)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _counter++;
                            });
                          },
                          icon: const Icon(Icons.add,
                              size: 30, color: Colors.green)),
                    ],
                  )
                : const Center(
                    child: Text('Maximum Limit Reached',
                        style: TextStyle(fontSize: 20)),
                  ),
          )
        ],
      ),
    );
  }
}

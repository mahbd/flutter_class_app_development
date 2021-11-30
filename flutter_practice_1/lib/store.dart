import 'package:flutter/material.dart';

class StoreCounter extends StatefulWidget {
  const StoreCounter({Key? key}) : super(key: key);

  @override
  _StoreCounterState createState() => _StoreCounterState();
}

class _StoreCounterState extends State<StoreCounter> {
  int _count = 0;

  void changeCount(int toChange) {
    setState(() {
      _count += toChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Total count:',
                style: TextStyle(fontSize: 25, color: Colors.red)),
            const Padding(padding: EdgeInsets.only(left: 10, right: 10)),
            Text(
              '$_count',
              style: const TextStyle(fontSize: 25, color: Colors.red),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _count < 11
              ? [
                  const Text('Increase counter:',
                      style: TextStyle(fontSize: 25, color: Colors.red)),
                  IconButton(
                      onPressed: () => changeCount(1),
                      icon: const Icon(Icons.add))
                ]
              : const [
                  Text('Maximum limit reached',
                      style: TextStyle(fontSize: 25, color: Colors.red))
                ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _count > 0
              ? [
                  const Text('Decrease counter',
                      style: TextStyle(fontSize: 25, color: Colors.red)),
                  IconButton(
                      onPressed: () => changeCount(-1),
                      icon: const Icon(Icons.remove))
                ]
              : [
                  const Text('Minimum Limit Reached',
                      style: TextStyle(fontSize: 25, color: Colors.red))
                ],
        ),
      ],
    );
  }
}

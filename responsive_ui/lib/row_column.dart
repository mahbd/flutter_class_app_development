import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.grey,
        constraints: const BoxConstraints.expand(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 100,
              width: 200,
              color: Colors.green,
            ),
            Container(
              height: 100,
              width: 200,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

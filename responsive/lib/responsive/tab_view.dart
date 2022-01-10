import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        color: Colors.orange,
        child: const Text(
          'Tab View',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

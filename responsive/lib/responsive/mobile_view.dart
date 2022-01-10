import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        color: Colors.blue,
        child: const Text(
          'Mobile View',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        color: Colors.indigo,
        child: const Text(
          'Desktop View',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

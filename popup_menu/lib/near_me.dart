import 'package:flutter/material.dart';

class NearMe extends StatelessWidget {
  const NearMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('near me'),
      ),
      body: const Center(
        child: Center(
          child: Text('This is near me page'),
        ),
      ),
    );
  }
}

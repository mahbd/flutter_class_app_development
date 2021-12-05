import 'package:flutter/material.dart';

class NearMePage extends StatefulWidget {
  const NearMePage({Key? key}) : super(key: key);

  @override
  _NearMePageState createState() => _NearMePageState();
}

class _NearMePageState extends State<NearMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('This is near me page'),
      ),
      appBar: AppBar(
        title: const Text('Near Me'),
      ),
    );
  }
}

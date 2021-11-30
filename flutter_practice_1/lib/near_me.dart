import 'package:flutter/material.dart';

class NearMe extends StatefulWidget {
  const NearMe({Key? key}) : super(key: key);

  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {
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

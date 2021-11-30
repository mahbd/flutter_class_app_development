import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> appDrawerElements = [
    {'text': 'Home', 'icon': const Icon(Icons.home)},
    {'text': 'Message', 'icon': const Icon(Icons.message)},
    {'text': 'Group', 'icon': const Icon(Icons.group)},
    {'text': 'Contacts', 'icon': const Icon(Icons.contacts)}
  ];
  final int index = 0;

  List<Widget> createAppDrawerElements() {
    List<Widget> toReturn = [];
    for (int i = 0; i < appDrawerElements.length; i++) {
      toReturn.insert(
          0,
          ListTile(
            leading: appDrawerElements[i]['icon'],
            title: Text(appDrawerElements[i]['text']),
          ));
    }
    return toReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Drawer'),
          actions: [],
        ),
        drawer: Drawer(
          child: Column(
            children: createAppDrawerElements(),
          ),
        ));
  }
}

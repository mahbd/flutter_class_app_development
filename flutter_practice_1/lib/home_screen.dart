import 'package:flutter/material.dart';
import 'package:flutter_practice_1/near_me.dart';
import 'package:flutter_practice_1/store.dart';

import 'popup_menu.dart';

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

  int _index = 0;

  void changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

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
    List<Widget> bodyElements = [
      Center(
        child: Column(
          children: [
            Text('Main Home Screen'),
            TextButton(
              onPressed: () {
                // go to NearMe page using material page route
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NearMePage();
                }));
              },
              child: const Text('Go to near me'),
            )
          ],
        ),
      ),
      const StoreCounter(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Drawer'),
        actions: [
          TextButton(
            child: const PopUpMenu(),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: createAppDrawerElements(),
        ),
      ),
      body: bodyElements[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: changeIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
              color: Colors.red,
            ),
            label: 'Store',
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popup_menu/near_me.dart';
import 'package:url_launcher/url_launcher.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Popup Bottom Nav',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedItem = 0;

  void onTappedItem(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  List<Widget> widgetOption = [
    const Center(
      child: Text('1st body'),
    ),
    const Center(
      child: Text('2nd body'),
    ),
    const Center(
      child: Text('3rd body'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pop up bar'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                  child: ListTile(
                onTap: () {
                  launch("https://facebook.com/");
                },
                title: const Text('Facebook', style: TextStyle(fontSize: 20)),
                tileColor: Colors.amber,
                trailing: const Icon(Icons.facebook),
              )),
              PopupMenuItem(
                  child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NearMe()),
                  );
                },
                title: const Text('Near me', style: TextStyle(fontSize: 20)),
                tileColor: Colors.blue,
                trailing: const Icon(Icons.near_me),
              )),
              const PopupMenuDivider(),
              PopupMenuItem(
                  child: ListTile(
                onTap: () {
                  launch('https://www.instagram.com/');
                },
                title: const Text('Instagram', style: TextStyle(fontSize: 20)),
                tileColor: Colors.red,
                trailing: const Icon(Icons.account_balance_sharp),
              )),
              PopupMenuItem(
                child: ListTile(
                  onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Google'),
                            content:
                                const Text('You will be redirected to google'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                  onPressed: () =>
                                      launch("https://google.com/"),
                                  child: const Text('Ok'))
                            ],
                          )),
                  title: const Text('Google', style: TextStyle(fontSize: 20)),
                  tileColor: Colors.green,
                  trailing: const Icon(Icons.golf_course),
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  title: const Text('Exit', style: TextStyle(fontSize: 20)),
                  tileColor: Colors.purple,
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ),
            ],
          )
        ],
      ),
      body: widgetOption[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.amber,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.next_plan,
                color: Colors.green,
              ),
              label: 'Next Plan'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'Profile'),
        ],
        currentIndex: selectedItem,
        type: BottomNavigationBarType.shifting,
        onTap: onTappedItem,
      ),
    );
  }
}

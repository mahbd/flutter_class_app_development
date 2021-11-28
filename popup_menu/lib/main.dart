import 'package:flutter/material.dart';
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
                      title: const Text('Facebook',
                          style: TextStyle(fontSize: 20)),
                      tileColor: Colors.amber,
                      trailing: const Icon(Icons.facebook),
                    )),
                    const PopupMenuItem(
                        child: ListTile(
                      title: Text('Near me', style: TextStyle(fontSize: 20)),
                      tileColor: Colors.blue,
                      trailing: Icon(Icons.near_me),
                    )),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                        child: ListTile(
                      title: Text('Instagram', style: TextStyle(fontSize: 20)),
                      tileColor: Colors.red,
                      trailing: Icon(Icons.account_balance_sharp),
                    )),
                    const PopupMenuItem(
                      child: ListTile(
                        title: Text('Google', style: TextStyle(fontSize: 20)),
                        tileColor: Colors.green,
                        trailing: Icon(Icons.golf_course),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                        child: ListTile(
                      title: Text('Logout', style: TextStyle(fontSize: 20)),
                      tileColor: Colors.purple,
                      trailing: Icon(Icons.exit_to_app),
                    )),
                  ])
        ],
      ),
    );
  }
}

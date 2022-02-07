import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _gridText = [
    'Text 1',
    'Text 2',
    'Text 3',
  ];
  final List<String> gridImages = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
  ];
  final List<Color> gridColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(gridImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text(_gridText[index],
                      style: TextStyle(
                          color: gridColors[index],
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return Container(
                color: Colors.green,
                child: Wrap(
                  children: <Widget>[
                    const ListTileModal(
                      title: 'Wi-Fi',
                      icon: Icon(Icons.wifi),
                      color: Colors.red,
                    ),
                    const ListTileModal(
                      title: 'Airplane Mode',
                      icon: Icon(Icons.airplanemode_active),
                      color: Colors.blue,
                    ),
                    const ListTileModal(
                      title: 'Bluetooth',
                      icon: Icon(Icons.bluetooth),
                      color: Colors.white,
                    ),
                    const ListTileModal(
                      title: 'Data Usage',
                      icon: Icon(Icons.data_usage),
                      color: Colors.orange,
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone_iphone),
                      title: const Text('Phone'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

class ListTileModal extends StatelessWidget {
  const ListTileModal(
      {Key? key, required this.title, required this.icon, required this.color})
      : super(key: key);
  final String title;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: color),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

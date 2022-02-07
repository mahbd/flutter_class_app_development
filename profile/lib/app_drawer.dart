import 'package:flutter/material.dart';

import 'drawer_items.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/profile.jpg'),
                    radius: 30,
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Mahmudul Alam',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          'Dedicated Computer Engineer',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ]),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          DrawerItem(drawerItem: drawerItems[0]),
          const Divider(color: Colors.grey),
          DrawerItem(drawerItem: drawerItems[1]),
          DrawerItem(drawerItem: drawerItems[2]),
          DrawerItem(drawerItem: drawerItems[3]),
          const Divider(color: Colors.grey),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('All labels',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          DrawerItem(drawerItem: drawerItems[4]),
          DrawerItem(drawerItem: drawerItems[5]),
          DrawerItem(drawerItem: drawerItems[6]),
          DrawerItem(drawerItem: drawerItems[7]),
          DrawerItem(drawerItem: drawerItems[8]),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required drawerItem})
      : _drawerItem = drawerItem,
        super(key: key);

  final Map<String, dynamic> _drawerItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _drawerItem['icon'],
      title: Text(_drawerItem['title']),
      onTap: () {
        Navigator.pop(context);
      },
      trailing: _drawerItem['trailing'],
    );
  }
}

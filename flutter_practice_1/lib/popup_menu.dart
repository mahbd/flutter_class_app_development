import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'near_me.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({Key? key}) : super(key: key);

  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: const ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Facebook'),
          ),
          onTap: () => launch('https://facebook.com/'),
        ),
        PopupMenuItem(
            child: const ListTile(
              leading: Icon(Icons.near_me),
              title: Text('Near me'),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NearMePage();
              }));
            }),
      ],
    );
  }
}

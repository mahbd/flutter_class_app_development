import 'package:flutter/material.dart';

final List<Map<String, dynamic>> drawerItems = <Map<String, dynamic>>[
  {
    'title': 'All Inboxes',
    'icon': const Icon(Icons.inbox),
    'trailing':
        const Text('15', style: TextStyle(color: Colors.grey, fontSize: 12)),
  },
  {
    'title': 'Primary',
    'icon': const Icon(Icons.mail),
    'trailing':
        const Text('15', style: TextStyle(color: Colors.grey, fontSize: 12))
  },
  {
    'title': 'Social',
    'icon': const Icon(Icons.people),
    'trailing': const DrawerTrail(text: '14 new', bgColor: Colors.blueAccent),
  },
  {
    'title': 'Promotions',
    'icon': const Icon(Icons.local_offer),
    'trailing': const DrawerTrail(text: '99+ new', bgColor: Colors.greenAccent),
  },
  {
    'title': 'Starred',
    'icon': const Icon(Icons.star),
    'trailing': const Text(''),
  },
  {
    'title': 'Important',
    'icon': const Icon(Icons.label_important),
    'trailing': const Text(
      '1',
      style: TextStyle(color: Colors.grey, fontSize: 12),
    ),
  },
  {
    'title': 'Sent Mail',
    'icon': const Icon(Icons.send),
    'trailing': const Text(''),
  },
  {
    'title': 'Outbox',
    'icon': const Icon(Icons.send),
    'trailing': const Text(''),
  },
  {
    'title': 'Drafts',
    'icon': const Icon(Icons.drafts),
    'trailing': const Text(''),
  },
  {
    'title': 'All Emails',
    'icon': const Icon(Icons.email),
    'trailing': const Text(''),
  },
  {
    'title': 'Spam',
    'icon': const Icon(Icons.error),
    'trailing': const Text(''),
  },
  {
    'title': 'Trash',
    'icon': const Icon(Icons.delete),
    'trailing': const Text(''),
  },
];

class DrawerTrail extends StatefulWidget {
  const DrawerTrail({Key? key, required this.text, required this.bgColor})
      : super(key: key);
  final String text;
  final Color bgColor;

  @override
  State<DrawerTrail> createState() => _DrawerTrailState();
}

class _DrawerTrailState extends State<DrawerTrail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        widget.text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

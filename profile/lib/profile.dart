import 'package:flutter/material.dart';

import 'app_drawer.dart';
import 'upper_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      drawer: const MyAppDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: const [UpperProfile(), LowerProfile()],
        ),
      ),
    );
  }
}

class LowerProfile extends StatefulWidget {
  const LowerProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<LowerProfile> createState() => _LowerProfileState();
}

class _LowerProfileState extends State<LowerProfile> {
  final List<ListTile> _items = const [
    ListTile(
      title: Text('Email'),
      subtitle: Text('mahmudula2000@gmail.com'),
      leading: Icon(Icons.email),
    ),
    ListTile(
      title: Text('Mobile'),
      subtitle: Text('+8801567953635'),
      leading: Icon(Icons.mobile_friendly),
    ),
    ListTile(
      title: Text('Address'),
      subtitle: Text('Dhaka, Bangladesh'),
      leading: Icon(Icons.location_on),
    ),
    ListTile(
      title: Text('Twitter'),
      subtitle: Text('@mahmudula2000'),
      leading: Icon(Icons.ac_unit),
    ),
    ListTile(
      title: Text('Facebook'),
      subtitle: Text('Mahmudul Alam'),
      leading: Icon(Icons.facebook),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _items[index],
                ),
                const Divider(
                  height: 1,
                ),
              ],
            );
          }),
    );
  }
}

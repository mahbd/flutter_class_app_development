import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Login Page'),
      leading: const Icon(Icons.home),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

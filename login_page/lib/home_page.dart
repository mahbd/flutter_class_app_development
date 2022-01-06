import 'package:flutter/material.dart';

import 'my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = true, _isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: const MyAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'A mobile application, also referred to as a mobile app or simply an app, is a computer program or software application designed to run on a mobile device such as a phone, tablet, or watch',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              onChanged: (value) => setState(() {
                _isEmpty = value.isEmpty;
              }),
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'abc@gmail.com',
                prefixIcon: const Icon(Icons.email),
                suffixIcon: IconButton(
                  onPressed: () {
                    _emailController.clear();
                    setState(() {
                      _isEmpty = true;
                    });
                  },
                  icon: !_isEmpty
                      ? const Icon(Icons.clear)
                      : const Icon(Icons.clear_outlined),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              obscureText: _isVisible,
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: _isVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                print(_emailController.text);
                print(_passwordController.text);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: Text('login', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: MyAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            const Text(
              'A mobile application, also referred to as a mobile app or simply an app, '
              'is a computer program or software application designed to run on a mobile device such as a phone, tablet, or watch',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'abc@gmail.com',
                prefixIcon: Icon(Icons.email),
                suffixIcon: InkWell(
                  onTap: () {
                    emailController.clear();
                  },
                  child: Icon(Icons.clear),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              obscureText: isVisible,
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                prefixIcon: Icon(Icons.password),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(Icons.visibility),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.cyanAccent,
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: Text('login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

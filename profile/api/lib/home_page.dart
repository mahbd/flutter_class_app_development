import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? temp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        alignment: Alignment.center,
        child: Text('25 C'),
      ),
    );
  }
}

getWeatherData() async {
  String url =
      "https://api.openweathermap.org/data/2.5/weather?q=rangpur&appid=642b5e9a01b487adf2673534bf7f87ca&q=metric";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  print(data['main']['temp']);
}

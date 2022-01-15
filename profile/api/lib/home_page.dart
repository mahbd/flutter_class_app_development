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
  String? cityName;

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Current Temp'),
            Text(
              "$temp C",
              style: const TextStyle(fontSize: 50),
            ),
            Text('City name: $cityName'),
          ],
        ),
      ),
    );
  }

  getWeatherData() async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=rangpur&appid=642b5e9a01b487adf2673534bf7f87ca&units=metric";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    setState(() {
      temp = data['main']['temp'].floor().toString();
      cityName = data['name'];
    });
  }
}

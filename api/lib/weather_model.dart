import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'const.dart';

class Weather {
  String? cityName;
  String? longitude;
  String? latitude;
  double? temperatureCelsius;
  double? humidity;
  double? pressure;

  Weather({
    this.cityName,
    this.latitude,
    this.longitude,
    this.temperatureCelsius,
    this.humidity,
    this.pressure,
  });

  void callAPI(Function reloader) {
    if (cityName == null && latitude == null && longitude == null) {
      throw ErrorWidget(
        'Please enter a city name or latitude and longitude',
      );
    }
    String url = 'http://api.openweathermap.org/data/2.5/weather?units=metric&';
    if (cityName != null) {
      url += 'q=$cityName';
    } else {
      url += 'lat=$latitude&lon=$longitude';
    }
    print(url);
    url += '&appid=$appId';
    http.get(Uri.parse(url)).then((value) {
      if (value.statusCode == 200) {
        jsonDecode(value.body)['main']['temp'];
        var data = Map<String, dynamic>.from(jsonDecode(value.body));
        cityName = data['name'];
        longitude = data['coord']['lon'].toString();
        latitude = data['coord']['lat'].toString();
        temperatureCelsius = data['main']['temp'];
        humidity = data['main']['humidity'];
        pressure = data['main']['pressure'];
        reloader();
      } else {
        // throw ErrorWidget(
        //   'Error fetching data',
        // );
      }
    });
  }
}

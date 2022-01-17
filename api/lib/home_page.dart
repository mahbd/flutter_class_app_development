import 'weather_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather weather = Weather(cityName: "Rangpur");
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    weather.callAPI(_reloader);
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: WeatherCard(weather: weather),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 400,
                child: TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter City Name',
                  ),
                  onSubmitted: (String value) {
                    weather.cityName = value;
                    weather.callAPI(_reloader);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                child: const Text('Locate me'),
                onPressed: () {
                  Geolocator.getLastKnownPosition().then((value) {
                    if (value != null) {
                      weather.latitude = value.latitude.toString();
                      weather.longitude = value.longitude.toString();
                      weather.cityName = null;
                      weather.callAPI(_reloader);
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) =>
                        states.contains(MaterialState.pressed)
                            ? Colors.blue
                            : Colors.blueGrey,
                  ),
                  foregroundColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) =>
                        states.contains(MaterialState.pressed)
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _reloader() {
    setState(() {});
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('City: ${weather.cityName}'),
              Text('Lat: ${weather.latitude}'),
              Text('Lon: ${weather.longitude}'),
              Text('Humidity: ${weather.humidity}%'),
              Text('Pressure: ${weather.pressure} hPa'),
            ],
          ),
          Text(
            '${weather.temperatureCelsius}°C',
            style: const TextStyle(fontSize: 55),
          ),
        ],
      ),
    );
  }
}

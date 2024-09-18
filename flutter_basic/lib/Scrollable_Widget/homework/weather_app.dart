import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
    title: 'Weather App',
    home: WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({
    super.key,
  });

  final List<Weather> weatherList = [
    const Weather(
      bgDay: 'assets/images/morning.jpg',
      city: 'Ha noi city',
      time: '10:00',
      weather: 'Cloudy',
      iconWeather: 'assets/svg/day_icon.svg',
      temperature: '30°C',
    ),
    const Weather(
      bgDay: 'assets/images/evening.jpg',
      city: 'Ha noi city',
      time: '22:00',
      weather: 'clear',
      iconWeather: 'assets/svg/night_icon.svg',
      temperature: '30°C',
    ),
    const Weather(
      bgDay: 'assets/images/morning.jpg',
      city: 'Ha noi city',
      time: '10:00',
      weather: 'Cloudy',
      iconWeather: 'assets/svg/day_icon.svg',
      temperature: '30°C',
    ),
    const Weather(
      bgDay: 'assets/images/evening.jpg',
      city: 'Ha noi city',
      time: '22:00',
      weather: 'clear',
      iconWeather: 'assets/svg/night_icon.svg',
      temperature: '30°C',
    ),
    const Weather(
      bgDay: 'assets/images/morning.jpg',
      city: 'Ha noi city',
      time: '10:00',
      weather: 'Cloudy',
      iconWeather: 'assets/svg/day_icon.svg',
      temperature: '30°C',
    ),
    const Weather(
      bgDay: 'assets/images/evening.jpg',
      city: 'Ha noi city',
      time: '22:00',
      weather: 'clear',
      iconWeather: 'assets/svg/night_icon.svg',
      temperature: '30°C',
    ),
    const Weather(
      bgDay: 'assets/images/morning.jpg',
      city: 'Ha noi city',
      time: '10:00',
      weather: 'Cloudy',
      iconWeather: 'assets/svg/day_icon.svg',
      temperature: '30°C',
    ),
    const Weather(
      bgDay: 'assets/images/evening.jpg',
      city: 'Ha noi city',
      time: '22:00',
      weather: 'clear',
      iconWeather: 'assets/svg/night_icon.svg',
      temperature: '30°C',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            itemCount: weatherList.length,
            itemBuilder: (context, index) {
              Weather weather = weatherList[index];
              return Weather(
                bgDay: weather.bgDay,
                city: weather.city,
                time: weather.time,
                weather: weather.weather,
                iconWeather: weather.iconWeather,
                temperature: weather.temperature,
              );
            },
          ),
        ),
      ),
    );
  }
}

class Weather extends StatelessWidget {
  const Weather({
    super.key,
    required this.bgDay,
    required this.city,
    required this.time,
    required this.weather,
    required this.iconWeather,
    required this.temperature,
  });

  final String bgDay;
  final String city;
  final String time;
  final String weather;
  final String iconWeather;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: MediaQuery.of(context).size.height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(bgDay),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  weather,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  iconWeather,
                  height: MediaQuery.of(context).size.width * 0.16,
                ),
                Text(
                  temperature,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_basic/basic_display_widgets/homework/weahter_temperature.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: WeatherHomeScreen(),
      home: WeahterTemperature(
        local: '10.82, 205.24',
        bgUrl: 'assets/images/bg_light.png',
        nameCity: 'Hà Nội',
        iconWeatherUrl: 'assets/images/bg_clear.png',
        weather: 'Clear',
        temperature: '24°C',
        description: 'Duststop, sandstorm, drifting and blowing snow',
        weatherData: [
          {
            'Humidify': '40%',
            'PM10': '33.4 Mg/m3',
            'UV': '2.2',
          },
          {
            'Wind': '2km/h',
            'Sunrise': '6:35',
            'Sunset': '17:55',
          }
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/Assignment/weahter_temperature.dart';
import 'package:flutter_basic/Assignment/weather_home_screen.dart';

class Routes {
  static Route<dynamic>? onGenerate(RouteSettings settings) {
    final route = settings.name;
    final city = settings.arguments != null
        ? settings.arguments as String
        : 'Unknown City'; // Default if no city is passed

    switch (route) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WeatherHomeScreen());
      case 'weather_temperature':
        return MaterialPageRoute(
          builder: (_) => WeahterTemperature(
            local: '10.82, 205.24',
            bgUrl: 'assets/images/bg_light.png',
            city: city,
            iconWeatherUrl: 'assets/images/bg_clear.png',
            weather: 'Clear',
            temperature: '24°C',
            description: 'Duststop, sandstorm, drifting and blowing snow',
            weatherData: const [
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
      default:
        return null;
    }
  }
}

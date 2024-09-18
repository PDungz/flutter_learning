import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  String bgDay;
  String city;
  String time;
  String weather;
  String iconWeather;
  String temperature;

  Weather({
    required this.bgDay,
    required this.city,
    required this.time,
    required this.weather,
    required this.iconWeather,
    required this.temperature,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bgDay': bgDay,
      'city': city,
      'time': time,
      'weather': weather,
      'iconWeather': iconWeather,
      'temperature': temperature,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      bgDay: map['bgDay'] as String,
      city: map['city'] as String,
      time: map['time'] as String,
      weather: map['weather'] as String,
      iconWeather: map['iconWeather'] as String,
      temperature: map['temperature'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}

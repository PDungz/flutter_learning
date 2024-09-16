import 'package:flutter/material.dart';
import 'package:flutter_basic/flutter_with_container_row_column_stack_wrap/homework/home/home_page.dart';
import 'package:flutter_basic/flutter_with_container_row_column_stack_wrap/homework/weathers/weather_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(),
        iconTheme: const IconThemeData(),
      ),
      home: const HomePage(),
      routes: {
        '/weather_page': (context) => const WeatherPage(),
        '/home_page': (context) => const HomePage(),
      },
    ),
  );
}

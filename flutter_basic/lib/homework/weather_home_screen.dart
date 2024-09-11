// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionOneInRow extends StatelessWidget {
  final String city;

  final String time;
  final String weatherType;
  const SectionOneInRow({
    super.key,
    required this.city,
    required this.time,
    required this.weatherType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          weatherType,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class SectionTwoInRow extends StatelessWidget {
  final String iconPath;

  final double temperature;
  const SectionTwoInRow({
    super.key,
    required this.iconPath,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 100,
          height: 50,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "$temperature°C",
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              WeatherItem(
                city: "Ho Chi Minh City",
                time: "21:58",
                weatherType: "Cloudy night",
                temperature: 29.5,
                backgroundPath: "assets/images/bg_light.png",
                iconPath: "assets/svg/night_icon.svg",
              ),
              WeatherItem(
                city: "Ho Chi Minh City",
                time: "21:58",
                weatherType: "Cloudy night",
                temperature: 29.5,
                backgroundPath: "assets/images/bg-night.png",
                iconPath: "assets/svg/night_icon.svg",
              ),
              WeatherItem(
                city: "Ho Chi Minh City",
                time: "21:58",
                weatherType: "Cloudy night",
                temperature: 29.5,
                backgroundPath: "assets/images/bg-night.png",
                iconPath: "assets/svg/night_icon.svg",
              ),
              WeatherItem(
                city: "Ho Chi Minh City",
                time: "21:58",
                weatherType: "Cloudy night",
                temperature: 29.5,
                backgroundPath: "assets/images/bg_light.png",
                iconPath: "assets/svg/night_icon.svg",
              ),
              WeatherItem(
                city: "Ho Chi Minh City",
                time: "21:58",
                weatherType: "Cloudy night",
                temperature: 29.5,
                backgroundPath: "assets/images/bg_light.png",
                iconPath: "assets/svg/night_icon.svg",
              ),
              WeatherItem(
                city: "Ho Chi Minh City",
                time: "21:58",
                weatherType: "Cloudy night",
                temperature: 29.5,
                backgroundPath: "assets/images/bg-night.png",
                iconPath: "assets/svg/night_icon.svg",
              ),
              WeatherItem(
                city: "Ho Chi Minh City",
                time: "21:58",
                weatherType: "Cloudy night",
                temperature: 29.5,
                backgroundPath: "assets/images/bg-night.png",
                iconPath: "assets/svg/night_icon.svg",
              ),
              WeatherItem(
                  city: "Ho Chi Minh City",
                  time: "21:58",
                  weatherType: "Cloudy night",
                  temperature: 29.5,
                  backgroundPath: "assets/images/bg_light.png",
                  iconPath: "assets/svg/night_icon.svg"),
            ],
          ),
        ),
      )),
    );
  }
}

class WeatherItem extends StatelessWidget {
  final String city;
  final String time;
  final String weatherType;
  final double temperature;
  final String backgroundPath;
  final String iconPath;
  const WeatherItem({
    Key? key,
    required this.city,
    required this.time,
    required this.weatherType,
    required this.temperature,
    required this.backgroundPath,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: AssetImage(backgroundPath), fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SectionOneInRow(city: city, time: time, weatherType: weatherType),
          SectionTwoInRow(iconPath: iconPath, temperature: temperature)
        ],
      ),
    );
  }
}

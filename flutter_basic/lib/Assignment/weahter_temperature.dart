import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForecastTwoToSing extends StatelessWidget {
  final String title;

  final String maxTemp;
  final String minTemp;
  final List<String> times;
  final List<String> icons; // Paths to the SVG icons
  const ForecastTwoToSing({
    super.key,
    required this.title,
    required this.maxTemp,
    required this.minTemp,
    required this.times,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(14, 141, 138, 138).withOpacity(0.4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                CupertinoIcons.cloud_sun_fill,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 10),
            height: 1,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Max: $maxTemp',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                'Min: $minTemp',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              times.length,
              (index) => Column(
                children: [
                  Text(
                    times[index],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SvgPicture.asset(
                    icons[index],
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeahterTemperature extends StatelessWidget {
  final String local;
  final String bgUrl;
  final String city;
  final String iconWeatherUrl;
  final String weather;
  final String temperature;
  final String description;
  final List<Map<String, String>> weatherData;

  const WeahterTemperature({
    super.key,
    required this.local,
    required this.bgUrl,
    required this.city,
    required this.iconWeatherUrl,
    required this.weather,
    required this.temperature,
    required this.description,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.1),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/', // Pass your desired city
            );
          },
          icon: const Icon(
            CupertinoIcons.bars,
            color: Colors.white,
          ),
        ),
        title: Container(
          margin: const EdgeInsets.only(right: 62),
          alignment: Alignment.center,
          child: Text(
            local,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              bgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(top: 100, left: 12, right: 12),
            child: Column(
              children: [
                WeatherInformationOfTheLocation(
                    nameCity: city,
                    iconWeatherUrl: iconWeatherUrl,
                    weather: weather,
                    temperature: temperature,
                    description: description),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        WeatherDataOneToSing(weatherData: weatherData),
                        const SizedBox(height: 12),
                        const ForecastTwoToSing(
                          title: 'FORECAST',
                          maxTemp: '24°C',
                          minTemp: '20°C',
                          times: ['6:00', '9:00', '12:00', '15:00'],
                          icons: [
                            'assets/svg/day_icon.svg',
                            'assets/svg/day_icon.svg',
                            'assets/svg/day_icon.svg',
                            'assets/svg/day_icon.svg'
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherDataOneToSing extends StatelessWidget {
  final List<Map<String, String>> weatherData;

  const WeatherDataOneToSing({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(14, 141, 138, 138).withOpacity(0.4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: weatherData.map((mapData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: mapData.entries.map((entry) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '${entry.key}: ${entry.value}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  );
                }).toList(), // Convert Iterable to List<Widget>
              );
            }).toList(), // Convert Iterable to List<Widget>
          ),
        ),
      ],
    );
  }
}

class WeatherInformationOfTheLocation extends StatelessWidget {
  final String nameCity;

  final String iconWeatherUrl;
  final String weather;
  final String temperature;
  final String description;
  const WeatherInformationOfTheLocation({
    super.key,
    required this.nameCity,
    required this.iconWeatherUrl,
    required this.weather,
    required this.temperature,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nameCity,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 42,
            color: Colors.white,
          ),
        ),
        Image.asset(
          iconWeatherUrl,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.width * 0.3,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          weather,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        Text(
          temperature,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 84,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

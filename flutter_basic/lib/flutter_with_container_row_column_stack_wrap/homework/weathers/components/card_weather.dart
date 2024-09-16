import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardWeather extends StatelessWidget {
  const CardWeather({
    super.key,
    required this.imageBgUrl,
    required this.nameCity,
    required this.time,
    required this.weather,
    required this.imageUrl,
    required this.temp,
  });

  final String imageBgUrl;
  final String nameCity;
  final String time;
  final String weather;
  final String imageUrl;
  final String temp;

  Widget _builText(String nameCity, double size) {
    return Text(
      nameCity,
      style: TextStyle(
        fontSize: size,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/home_page');
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 8,
                blurRadius: 2,
                offset: const Offset(1, 1),
              )
            ],
            image: DecorationImage(
                image: AssetImage(
                  imageBgUrl,
                ),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _builText(nameCity, 20),
                      const SizedBox(height: 8),
                      _builText(time, 16),
                      const SizedBox(height: 8),
                      _builText(weather, 16),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        imageUrl,
                        height: 42,
                      ),
                      const SizedBox(height: 16),
                      _builText(temp, 20)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TempLocaleWeather extends StatelessWidget {
  const TempLocaleWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hà Nội',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 72,
              color: Colors.white,
            ),
          ),
          Image.asset(
            'assets/images/weathers/clear.png',
          ),
          const SizedBox(height: 10),
          const Text(
            'clear',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            '32°C',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 68,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: const Text(
              'Duststop, sandstorm, drifting and blowing snow',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

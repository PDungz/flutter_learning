import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InforDetail extends StatelessWidget {
  const InforDetail({super.key});

  Widget _weather(String time, String imageUrl) {
    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            height: 15,
            child: Text(
              '$time AM',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0.09,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            imageUrl,
            height: 42,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                CupertinoIcons.sun_dust,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'FORCAST',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Max: 32°C',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                'Min: 20°C',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _weather('6', 'assets/images/weathers/clear.png'),
              _weather('9', 'assets/images/weathers/clouds.png'),
              _weather('12', 'assets/images/weathers/cloudy.png'),
              _weather('15', 'assets/images/weathers/clear.png'),
            ],
          ),
        ],
      ),
    );
  }
}

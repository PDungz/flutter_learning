import 'package:flutter/material.dart';

class InforMainWeather extends StatelessWidget {
  const InforMainWeather({super.key});

  // Define a common text style for reuse
  static const TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0.09,
  );

  // A helper method to create Text widgets
  Widget _buildText(String text) {
    return SizedBox(
      width: double.infinity,
      height: 29,
      child: Text(
        text,
        style: _textStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // First Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText('Humidity 40%'),
                const SizedBox(height: 16),
                _buildText('PM10 33.4 Mg/m3'),
                const SizedBox(height: 16),
                _buildText('UV 2.2'),
              ],
            ),
          ),
          // Second Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildText('Wind 2km/h'),
                const SizedBox(height: 16),
                _buildText('Sunrise 6:35'),
                const SizedBox(height: 16),
                _buildText('Sunset 17:55'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

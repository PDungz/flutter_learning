import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0x001E283D), Color(0xFF1E283D)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, // Space evenly for balanced alignment
        crossAxisAlignment: CrossAxisAlignment.center, // Center the two columns
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "8.3",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
                Text(
                  "IMDB",
                  style: TextStyle(fontSize: 18, color: primaryColor),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height *
                0.09, // Adjusted height for spacing
            width: 1,
            color: primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "7.9",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
                Text(
                  "Kinopoisk",
                  style: TextStyle(fontSize: 18, color: primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

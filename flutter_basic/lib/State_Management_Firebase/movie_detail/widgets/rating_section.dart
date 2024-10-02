import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(color: Color(0xff1F293D)),
      child: const Row(
        children: [
          Expanded(child: ScoreItem(score: 8.3, title: "IMDB")),
          Expanded(child: ScoreItem(score: 7.9, title: "Kinopoisk")),
        ],
      ),
    );
  }
}

class ScoreItem extends StatelessWidget {
  final double score;
  final String title;
  const ScoreItem({
    Key? key,
    required this.score,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          score.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff637394),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}

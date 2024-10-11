// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String posterImgPath;
  final String title;
  final String genre;
  final double score;
  const MovieItem({
    super.key,
    required this.posterImgPath,
    required this.title,
    required this.genre,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          constraints: const BoxConstraints(minHeight: 230),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(posterImgPath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: ScroreBadge(score: score),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          genre,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xff637394),
          ),
        ),
      ],
    );
  }
}

class ScroreBadge extends StatelessWidget {
  final double score;
  const ScroreBadge({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final isLowScore = score < 7.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
          color: isLowScore
              ? const Color(0xff1F293D).withOpacity(.7)
              : const Color(0xffFF8036),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        score.toStringAsFixed(1),
        style: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
      ),
    );
  }
}
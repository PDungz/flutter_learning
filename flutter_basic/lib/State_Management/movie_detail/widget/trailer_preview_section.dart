import 'package:flutter/material.dart';

class TrailerPreviewSection extends StatelessWidget {
  const TrailerPreviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://i.ytimg.com/vi/0h8ZBXUNXXM/maxresdefault.jpg",
            )),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.3), shape: BoxShape.circle),
          child: Icon(
            Icons.play_arrow_rounded,
            size: 35,
            color: Colors.white.withOpacity(.9),
          ),
        ),
      ),
    );
  }
}

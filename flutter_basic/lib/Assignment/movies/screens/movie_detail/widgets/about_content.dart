// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_basic/Assignment/movies/screens/movie_detail/widgets/movie_info_section.dart';
import 'package:flutter_basic/Assignment/movies/screens/movie_detail/widgets/rating_section.dart';
import 'package:flutter_basic/Assignment/movies/screens/movie_detail/widgets/trailer_preview_section.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TrailerPreviewSection(),
                RatingSection(),
                MovieInfoSection(),
              ],
            ),
          ),
        ),
        SafeArea(
          bottom: true,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xff1F293D).withOpacity(.7),
            child: ElevatedButton(
                onPressed: () {}, child: const Text("Select session")),
          ),
        )
      ],
    );
  }
}

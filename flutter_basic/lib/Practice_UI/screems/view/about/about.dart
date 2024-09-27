import 'package:flutter/material.dart';
import 'package:flutter_basic/Practice_UI/screems/view/about/content/content.dart';
import 'package:flutter_basic/Practice_UI/screems/view/about/movie_rating.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final Color primaryColor = const Color(0xFF637394);
  final Color bgColor = const Color(0xFF253554);
  final Color bgColorOP = const Color(0x4D253554);
  final Color buttonColor = const Color(0xFFFF8036);

  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://youtu.be/XtEeTZr_NIk?si=ljeserL1hCfGse_f")!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.24,
                  width: double.infinity,
                  child: YoutubePlayer(
                    controller: _youtubeController,
                    showVideoProgressIndicator: true,
                  ),
                ),
                MovieRating(primaryColor: primaryColor),
                Content(bgColorOP: bgColorOP, primaryColor: primaryColor),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: double.infinity,
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Select session',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

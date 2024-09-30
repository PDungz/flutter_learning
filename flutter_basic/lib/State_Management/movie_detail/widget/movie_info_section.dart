import 'package:flutter/material.dart';

class MovieInfoItem extends StatelessWidget {
  final String title;
  final String content;
  final Widget? customContent;
  const MovieInfoItem({
    Key? key,
    required this.title,
    this.content = "",
    this.customContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 74,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff637394),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: customContent ??
                  Text(
                    content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ))
        ],
      ),
    );
  }
}

class MovieInfoSection extends StatelessWidget {
  const MovieInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 16,
          ),
          MovieInfoItem(
            title: "Certificate",
            content: "16+",
          ),
          MovieInfoItem(
            title: "Runtime",
            content: "02:56",
          ),
          MovieInfoItem(
            title: "Release",
            content: "2022",
          ),
          MovieInfoItem(
            title: "Genre",
            content: "Action, Crime, Drama, Animation, Comedy",
          ),
          MovieInfoItem(
            title: "Director",
            content: "Matt Reeves",
          ),
          MovieInfoItem(
            title: "Cast",
            content:
                "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, 	Andy Serkis, Peter Sarsgaard",
          ),
          MovieInfoItem(
            title: "Cast",
            content:
                "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, 	Andy Serkis, Peter Sarsgaard",
          ),
          MovieInfoItem(
            title: "Cast",
            content:
                "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, 	Andy Serkis, Peter Sarsgaard",
          ),
        ],
      ),
    );
  }
}

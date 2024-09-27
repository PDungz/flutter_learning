import 'package:flutter/material.dart';
import 'package:flutter_basic/Practice_UI/screems/view/about/content/des_item.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.bgColorOP,
    required this.primaryColor,
  });

  final Color bgColorOP;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColorOP,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            desItem(
              primaryColor: primaryColor,
              title: "Certificate",
              des: "+16",
              onborder: true,
            ),
            desItem(
              primaryColor: primaryColor,
              title: "Runtime",
              des: "02:56",
              onborder: false,
            ),
            desItem(
              primaryColor: primaryColor,
              title: "Release",
              des: "2022",
              onborder: false,
            ),
            desItem(
              primaryColor: primaryColor,
              title: "Genre",
              des: "Action, Crime, Drama, Animation, Comedy",
              onborder: false,
            ),
            desItem(
              primaryColor: primaryColor,
              title: "Director",
              des: "Matt Reeves",
              onborder: false,
            ),
            desItem(
              primaryColor: primaryColor,
              title: "Cast",
              des:
                  "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, 	Andy Serkis, Peter Sarsgaard",
              onborder: false,
            ),
          ],
        ),
      ),
    );
  }
}

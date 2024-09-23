import 'package:flutter/material.dart';
import 'package:flutter_basic/Assignment/movies/screens/movie_detail/widgets/filter_section.dart';
import 'package:flutter_basic/Assignment/movies/screens/movie_detail/widgets/group_by_section.dart';
import 'package:flutter_basic/Assignment/movies/screens/movie_detail/widgets/show_time_item.dart';

class SessionsContent extends StatelessWidget {
  const SessionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterSection(),
        const GroupBySection(),
        Expanded(
            child: ListView(
          children: const [
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, null, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [null, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [null, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, 1000, 1500, null]),
            ShowtimeItem(
                time: "14:40",
                typeOfTheater: "Pyc",
                theaterName: "Eurasia Cinema7",
                listPriceByPriceType: [2200, 1000, 1500, null]),
          ],
        ))
      ],
    );
  }
}

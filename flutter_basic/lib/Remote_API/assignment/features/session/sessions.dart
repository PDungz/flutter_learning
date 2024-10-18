import 'package:flutter/material.dart';

import '../../core/model/movie.dart';
import 'cinemar_list.dart';
import 'controls.dart';
import 'header.dart';
import 'movie_list.dart';

class Sessions extends StatefulWidget {
  const Sessions({super.key});

  @override
  State<Sessions> createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  final Color primaryColor = const Color(0xFF637394);
  final Color bgColor = const Color(0xFF253554);
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool switchValue = false;

  void _onSwitch(bool value) {
    setState(() {
      switchValue = value;
      if (value) {
        _pageController.animateToPage(_currentPage + 1,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      } else if (!value) {
        _pageController.animateToPage(_currentPage - 1,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });
  }

  final List<Movie> movies = [
    Movie(
      time: "9:00",
      params: "Pyc",
      movieName: "Eurasia Cinema7",
      price: ["230 ₸", "220 ₸", "", ""],
    ),
    Movie(
      time: "10:00",
      params: "Pyc",
      movieName: "Eurasia Cinema7",
      price: ["120 ₸", "", "220 ₸", ""],
    ),
    Movie(
      time: "12:00",
      params: "Pyc",
      movieName: "Eurasia Cinema7",
      price: ["100 ₸", "", "220 ₸", ""],
    ),
    Movie(
      time: "14:00",
      params: "Pyc",
      movieName: "Eurasia Cinema7",
      price: ["120 ₸", "220 ₸", "220 ₸", "220 ₸"],
    ),
    Movie(
      time: "15:00",
      params: "Pyc",
      movieName: "Eurasia Cinema7",
      price: ["200 ₸", "", "220 ₸", ""],
    ),
    Movie(
      time: "15:00",
      params: "Pyc",
      movieName: "Eurasia Cinema7",
      price: ["2200 ₸", "", "220 ₸", "240 ₸"],
    )
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(
      () {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Controls(
            iconColor: primaryColor,
            switchValue: switchValue,
            onSwitch: _onSwitch),
        Header(bgColor: bgColor, primaryColor: primaryColor),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              MovieList(movies: movies, primaryColor: primaryColor),
              CinemarList(movies: movies, primaryColor: primaryColor),
            ],
          ),
        ),
      ],
    );
  }
}

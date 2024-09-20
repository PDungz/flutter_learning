import 'package:flutter/material.dart';
import 'package:flutter_basic/CustomScrollView_PageView_Tabbar/homework/model/movie.dart';

class CinemarList extends StatelessWidget {
  const CinemarList({
    super.key,
    required this.movies,
    required this.primaryColor,
  });

  final List<Movie> movies;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length, // Set the number of items to display
      separatorBuilder: (context, index) => Divider(
        color: primaryColor,
      ),
      itemBuilder: (context, index) => SessionRow(
        primaryColor: primaryColor,
        movie: movies[index],
        index: index,
      ),
    );
  }
}

class SessionRow extends StatelessWidget {
  const SessionRow({
    super.key,
    required this.primaryColor,
    required this.movie,
    required this.index,
  });

  final Color primaryColor;
  final Movie movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        index % 3 == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.movieName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "ул. Петрова, д.24, ТЦ \"Евразия\"",
                              style: TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: primaryColor,
                            ),
                            Text(
                              "1.5km",
                              style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: primaryColor,
                  )
                ],
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          movie.time,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(movie.params,
                            style: TextStyle(color: primaryColor)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 2,
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: primaryColor,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          movie.price.length,
                          (index) => movie.price[index].isNotEmpty
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.14,
                                  child: Text(
                                    movie.price[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.14,
                                  child: Icon(
                                    Icons.fiber_manual_record_rounded,
                                    size: 16,
                                    color: primaryColor,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

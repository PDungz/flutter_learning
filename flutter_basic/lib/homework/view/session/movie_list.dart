import 'package:flutter/material.dart';
import 'package:flutter_basic/homework/core/model/movie.dart';

class MovieList extends StatelessWidget {
  const MovieList({
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
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
        child: SessionRow(
          primaryColor: primaryColor,
          movie: movies[index],
        ),
      ),
    );
  }
}

class SessionRow extends StatelessWidget {
  const SessionRow({
    super.key,
    required this.primaryColor,
    required this.movie,
  });

  final Color primaryColor;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  Text(movie.params, style: TextStyle(color: primaryColor)),
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
                Text(
                  movie.movieName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    movie.price.length,
                    (index) => movie.price[index].isNotEmpty
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                            child: Text(
                              movie.price[index],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                            child: Icon(
                              Icons.fiber_manual_record_rounded,
                              size: 14,
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
    );
  }
}

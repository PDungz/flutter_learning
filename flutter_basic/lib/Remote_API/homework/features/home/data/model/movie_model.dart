import 'package:flutter_basic/Remote_API/homework/features/home/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map(
            (e) => (e as num).toInt(),
          )
          .toList(),
      overview: json['overview'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'],
    );
  }
}

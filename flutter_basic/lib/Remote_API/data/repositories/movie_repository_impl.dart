import 'package:flutter_basic/Remote_API/domain/entities/movie.dart';
import 'package:flutter_basic/Remote_API/domain/repositories/movie_repository.dart';

import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getMovies() {
    return remoteDataSource.getMovies();
  }
}

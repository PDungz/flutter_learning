// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_basic/Remote_API/homework/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/domain/entities/genre.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/domain/entities/image_config_info.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/domain/entities/movie.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Genre>?> getGenre() {
    return remoteDataSource.getGenre();
  }

  @override
  Future<ImageConfigInfo?> getImageInfo() {
    return remoteDataSource.getImageConfigInfo();
  }

  @override
  Future<List<Movie>?> getMovies() {
    return remoteDataSource.getMovies();
  }
}

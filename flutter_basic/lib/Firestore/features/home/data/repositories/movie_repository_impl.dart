import '../../domain/entities/genre.dart';
import '../../domain/entities/image_configuration.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

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

  @override
  Future<List<Movie>?> getUpcommingMovies() {
    return remoteDataSource.getUpcommingMovies();
  }
}

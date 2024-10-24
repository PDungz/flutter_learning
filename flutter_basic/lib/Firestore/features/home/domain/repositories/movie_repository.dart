import '../entities/genre.dart';
import '../entities/image_configuration.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Genre>?> getGenre();
  Future<ImageConfigInfo?> getImageInfo();
  Future<List<Movie>?> getMovies();
  Future<List<Movie>?> getUpcommingMovies();
}

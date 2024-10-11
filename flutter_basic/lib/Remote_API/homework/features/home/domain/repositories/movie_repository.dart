import 'package:flutter_basic/Remote_API/homework/features/home/domain/entities/genre.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/domain/entities/image_config_info.dart';

import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Genre>?> getGenre();
  Future<ImageConfigInfo?> getImageInfo();
  Future<List<Movie>?> getMovies();
}

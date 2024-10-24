// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../entities/genre.dart';
import '../entities/image_configuration.dart';
import '../repositories/movie_repository.dart';

class GlobalInfoUsecases {
  final MovieRepository repository;
  GlobalInfoUsecases(this.repository);

  Future<List<Genre>?> getGenre() {
    return repository.getGenre();
  }

  Future<ImageConfigInfo?> getImageInfo() {
    return repository.getImageInfo();
  }
}

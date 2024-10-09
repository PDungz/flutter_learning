//!  use case để xử lý nghiệp vụ, ở đây có nghiệp vụ lấy danh sách phim
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}

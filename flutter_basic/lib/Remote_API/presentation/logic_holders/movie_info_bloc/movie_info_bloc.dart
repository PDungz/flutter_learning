import 'package:bloc/bloc.dart';
import 'package:flutter_basic/Remote_API/domain/entities/movie.dart';
import '../../../domain/usecase/move_usecase.dart';
part 'movie_info_event.dart';
part 'movie_info_state.dart';

//! Bước 4: Tích hợp BLoC
//? Trước tiên, hãy xác định các events (sự kiện) và states (trạng thái) mà BLoC của bạn sẽ xử lý.
//? Ví dụ, nếu bạn đang xây dựng một ứng dụng hiển thị danh sách phim,
//? bạn có thể có một số states như MoviesLoading, MoviesLoaded, và MoviesError.
//! Bước 4.3: Xử lý logic trong Bloc
//? Sau khi đã có các events và states, bạn cần tạo một BLoC để xử lý logic
class MovieInfoBloc extends Bloc<MoviesEvent, MoviesState> {
  GetMovies getMovies;
  MovieInfoBloc(
    this.getMovies,
  ) : super(MoviesInitial()) {
    on<LoadMovies>(_onLoadMovies);
  }

  Future<void> _onLoadMovies(
      LoadMovies event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    try {
      final movies = await getMovies();
      emit(MoviesLoaded(movies));
    } catch (error) {
      emit(MoviesError(error.toString()));
    }
  }
}
part of 'movie_info_bloc.dart';

class MoviesLoading extends MoviesState {}

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> upcommingMovies;
  MoviesLoaded(
    this.nowPlayingMovies,
    this.upcommingMovies,
  );
}

class MoviesError extends MoviesState {
  final String message;
  MoviesError(this.message);
}

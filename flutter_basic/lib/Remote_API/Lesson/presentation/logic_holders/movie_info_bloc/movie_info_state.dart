part of 'movie_info_bloc.dart';

class MoviesLoading extends MoviesState {}

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;
  MoviesLoaded(this.movies);
}

class MoviesError extends MoviesState {
  final String message;
  MoviesError(this.message);
}

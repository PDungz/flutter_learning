import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/movie_remote_data_source.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/usecase/move_usecase.dart';
import '../logic_holders/movie_info_bloc/movie_info_bloc.dart';

class NowPlayingMoviesScreen extends StatelessWidget {
  const NowPlayingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Now playing movies screen"),
      ),
      body: BlocProvider<MovieInfoBloc>(
        create: (_) => MovieInfoBloc(GetMovies(MovieRepositoryImpl(
            remoteDataSource: MovieRemoteDataSourceImpl(
          client: http.Client(),
        ))))
          ..add(LoadMovies()),
        child: BlocBuilder<MovieInfoBloc, MoviesState>(builder: (_, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MoviesLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.movies[index].title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(state.movies[index].overview),
                    const SizedBox(height: 16),
                  ],
                ));
              },
            );
          } else if (state is MoviesError) {
            return Center(child: Text(state.message));
          }
          return Container(); // Default empty container
        }),
      ),
    );
  }
}

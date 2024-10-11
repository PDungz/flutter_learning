import 'package:dio/dio.dart';
import 'package:flutter_basic/Remote_API/Lesson/data/models/movie_model.dart';

import '../../core/services/logger_service.dart';
import '../../domain/entities/movie.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Movie>> getMovies() async {
    final queryParams = {'language': 'en-US', 'page': 1};

    try {
      final result =
          await dio.get("/movie/now_playing", queryParameters: queryParams);
      final List<dynamic> moviesJson = result.data['results'];
      //! Sử dụng Model trong DataSource
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    }
    //! Error Handling
    on DioException catch (e) {
      printE(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printE("Unknown error: ${e.toString()}");
    }

    return [];
  }
}

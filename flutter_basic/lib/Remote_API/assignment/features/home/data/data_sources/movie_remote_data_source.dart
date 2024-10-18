// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_basic/Remote_API/assignment/core/services/logger_service.dart';
import 'package:flutter_basic/Remote_API/assignment/features/home/data/model/genre_model.dart';
import 'package:flutter_basic/Remote_API/assignment/features/home/data/model/image_config_info_model.dart';
import 'package:flutter_basic/Remote_API/assignment/features/home/data/model/movie_model.dart';
import 'package:flutter_basic/Remote_API/assignment/features/home/domain/entities/movie.dart';

abstract class MovieRemoteDataSource {
  Future<List<GenreModel>?> getGenre();
  Future<ImageConfigInfoModel?> getImageConfigInfo();
  Future<List<Movie>?> getMovies();
  Future<List<MovieModel>?> getUpcommingMovice();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;
  MovieRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<GenreModel>?> getGenre() async {
    final queryParams = {'language': 'en'};

    try {
      final result =
          await dio.get("/genre/movie/list", queryParameters: queryParams);
      final List<dynamic> movieJson = result.data['genres'];
      //! Su dung model trong datasource
      return movieJson
          .map(
            (json) => GenreModel.fromJson(json),
          )
          .toList();
    } on DioException catch (e) {
      printE(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printE("Unknow error: ${e.toString()}");
    }
    return null;
  }

  @override
  Future<ImageConfigInfoModel?> getImageConfigInfo() async {
    try {
      final result = await dio.get("/configuration");
      return ImageConfigInfoModel.fromJson(result.data['images']);
    } on DioException catch (e) {
      printE(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printE("Unknow error: ${e.toString()}");
    }
    return null;
  }

  @override
  Future<List<Movie>?> getMovies() async {
    final queryParams = {'language': 'en-US', 'page': '1'};

    try {
      final result =
          await dio.get("/movie/now_playing", queryParameters: queryParams);
      final List<dynamic> movieJson = result.data['results'];
      //! Su dung trong datasource
      return movieJson.map((json) => MovieModel.fromJson(json)).toList();
    } on DioException catch (e) {
      printE(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printE("Unknow error: ${e.toString()}");
    }
    return null;
  }

  @override
  Future<List<MovieModel>?> getUpcommingMovice() async {
    try {
      final queryParams = {'language': 'vi'};
      final result =
          await dio.get('/movie/upcoming', queryParameters: queryParams);

      final upcommingMovies = result.data['results'] as List<dynamic>;
      return upcommingMovies.map((json) => MovieModel.fromJson(json)).toList();
    } on DioException catch (e) {
      printE(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printE("Unknown error: ${e.toString()}");
    }
    return null;
  }
}

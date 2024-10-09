import 'dart:convert';
import 'package:flutter_basic/Remote_API/core/utils/dot_env_util.dart';
import 'package:flutter_basic/Remote_API/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

// const apiKey =
//     "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTI1NTA5OTFlNGYzN2M0NTQxZGNhNzY4MWI2OTMwNiIsIm5iZiI6MTcyODAzNzE4Ni40NjA5NTUsInN1YiI6IjY2ZmQxZWNmYzZmYmIyZjBjZGYyM2QyYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EcYvxzToP5ipX3iLjbQrWJBETp7qxsxhmmsj50nwI-4";

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;
  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getMovies() async {
    final apiKey = DotEnvUtil.apiKey;
    final host = DotEnvUtil.hostApi;
    final apiVersion = DotEnvUtil.apiVesion;

    var headers = {
      'Authorization': 'Bearer $apiKey',
      'Accept': 'application/json'
    };
    var queryParams = {'language': 'en-US', 'page': '1'};
    // var url = Uri.parse(
    //     'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1');
    // var url =
    //     Uri.http("api.themoviedb.org", "/3/movie/now_playing", queryParams);
    var url = Uri.http(host, "$apiVersion/movie/now_playing", queryParams);

    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> moviesJson = json.decode(response.body)['results'];
      //! Sử dụng Model trong DataSource
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

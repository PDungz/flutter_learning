import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/now_playing_movies_response.dart';

//! part để liên kết file giữa file khai báo và file generation
part 'movie_remote_data_source.g.dart';

//! @RestApi() là đánh dấu cho các tool generation biết đây là một retrofit
@RestApi()
abstract class MovieRemoteDataSource {
  //! factory là một từ khóa liên quan đến factory design pattern,
  //? để tạo ra một instance mới. Như đã biết, thì một abstract class không thể
  //? có constructor, Nhưng ở sử dụng với từ khóa factory để khởi tạo một instance
  //? mang kiểu giống với kiểu abstract nhưng lại là class thực thi

  //! _MovieRemoteDataSource chính là một class thực thi của abstract MovieRemoteDataSource.
  //? Class này được tự động generate, nằm trong file movie_remote_data_source.g.dart,
  //? sẽ xuất hiện sau khi chạy lệnh generate
  factory MovieRemoteDataSource(Dio dio, {String baseUrl}) =
      _MovieRemoteDataSource;

  //! @GET: chính là defined method của endpoint đó
  @GET("/movie/now_playing")
  Future<NowPlayingMoviesResponse> getNowPlayingMoviesResponse();
}

// class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
//   final Dio dio;

//   MovieRemoteDataSourceImpl({required this.dio});

//   @override
//   Future<List<MovieModel>> getMovies() async {
//     final queryParams = {'language': 'en-US', 'page': 1};

//     final result =
//         await dio.get("/movie/now_playing", queryParameters: queryParams);

//     if (result.statusCode == 200) {
//       final List<dynamic> moviesJson = result.data['results'];
//       //! Sử dụng Model trong DataSource
//       return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load movies');
//     }
//   }
// }

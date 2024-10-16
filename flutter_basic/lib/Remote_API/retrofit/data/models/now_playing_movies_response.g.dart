// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingMoviesResponse _$NowPlayingMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    NowPlayingMoviesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NowPlayingMoviesResponseToJson(
        NowPlayingMoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

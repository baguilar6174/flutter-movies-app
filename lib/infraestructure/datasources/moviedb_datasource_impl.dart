import 'package:dio/dio.dart';

import 'package:flutter_movies_app/config/config.dart';
import 'package:flutter_movies_app/domain/domain.dart';
import 'package:flutter_movies_app/infraestructure/infraestructure.dart';

class MovieDBDatasourceImpl extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDBApiKey,
        'language': 'es-EC'
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    final movideDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movideDBResponse.results
        .where((movie) => movie.posterPath != 'no-poster')
        .map((movie) => MovieMapper.movieDBToEntity(movie))
        .toList();
    return movies;
  }
}

import 'package:dio/dio.dart';

import 'package:flutter_movies_app/config/config.dart';
import 'package:flutter_movies_app/domain/domain.dart';
import 'package:flutter_movies_app/infraestructure/infraestructure.dart';

class MovieDBActorsDatasourceImpl extends ActorDatasource {
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
  Future<List<Actor>> getActorsByMovie(String id) async {
    final response = await dio.get('/movie/$id//credits');
    final castResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}

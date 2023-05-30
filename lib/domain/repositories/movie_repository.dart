import 'package:flutter_movies_app/domain/entities/entities.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}

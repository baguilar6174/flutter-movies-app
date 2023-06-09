import 'package:flutter_movies_app/domain/entities/entities.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<Movie> getMovie(String id);

  Future<List<Movie>> search(String query);
}

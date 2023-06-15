import 'package:flutter_movies_app/domain/entities/entities.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> getMovies({int limit = 10, offset = 0});
}

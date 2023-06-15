import 'package:flutter_movies_app/domain/domain.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<List<Movie>> getMovies({int limit = 10, offset = 0}) {
    return datasource.getMovies(limit: limit, offset: offset);
  }

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_movies_app/domain/domain.dart';

class IsarDatasourceImpl extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<Movie>> getMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    final movies =
        await isar.movies.where().offset(offset).limit(limit).findAll();
    return movies;
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final Movie? movie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();
    return movie != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();
    if (favoriteMovie != null) {
      // Delete from favorites
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.dbId!));
      return;
    }
    // Add to favorites
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}

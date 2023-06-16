import 'package:flutter_movies_app/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/domain/domain.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies =
        await localStorageRepository.getMovies(offset: page * 10, limit: 20);
    page++;
    final tempMoviesMap = <int, Movie>{};
    for (var movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }
    state = {...state, ...tempMoviesMap};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isInFavorites = state[movie.id] != null;
    if (isInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}

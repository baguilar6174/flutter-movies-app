import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';
import 'package:flutter_movies_app/domain/domain.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetch = ref.watch(movieRepositoryProvider);

  return MoviesNotifier(fetch: fetch.getNowPlaying);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetch;

  MoviesNotifier({required this.fetch}) : super([]);
  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetch(page: currentPage);
    state = [...state, ...movies];
  }
}

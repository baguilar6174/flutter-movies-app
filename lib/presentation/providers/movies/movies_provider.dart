import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';
import 'package:flutter_movies_app/domain/domain.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetch = ref.watch(movieRepositoryProvider);
  return MoviesNotifier(fetch: fetch.getNowPlaying);
});

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetch = ref.watch(movieRepositoryProvider);
  return MoviesNotifier(fetch: fetch.getPopular);
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetch = ref.watch(movieRepositoryProvider);
  return MoviesNotifier(fetch: fetch.getUpcoming);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetch;

  MoviesNotifier({required this.fetch}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetch(page: currentPage);
    state = [...state, ...movies];
    // Wait to render movies
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}

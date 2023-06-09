import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/presentation/providers/providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final isMoviesEmpty = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final isPopularMoviesEmpty = ref.watch(popularMoviesProvider).isEmpty;
  final isPpcomingMoviesEmpty = ref.watch(upcomingMoviesProvider).isEmpty;
  if (isMoviesEmpty || isPopularMoviesEmpty || isPpcomingMoviesEmpty) {
    return true;
  }
  return false;
});

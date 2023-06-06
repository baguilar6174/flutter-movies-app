import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/domain/domain.dart';
import 'package:flutter_movies_app/presentation/providers/providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final movies = ref.watch(nowPlayingMoviesProvider);
  if (movies.isEmpty) return [];
  return movies.sublist(0, 6);
});

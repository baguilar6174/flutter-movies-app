import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) isLastPage = true;
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(favoriteMoviesProvider).values.toList();

    if (movies.isEmpty) {
      final colors = Theme.of(context).colorScheme;

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline,
              size: 60,
              color: colors.primary,
            ),
            Text(
              'No favorite movies',
              style: TextStyle(fontSize: 30, color: colors.primary),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: MasonryListview(
        movies: movies,
        loadNextPage: loadNextPage,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';

class HomePage extends ConsumerStatefulWidget {
  static const name = 'home-page';

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(initialLoadingProvider);
    if (isLoading) return const FullScreenLoader();

    final movies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);

    return Scaffold(
      body: Visibility(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: CustomAppbar(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      Slideshow(movies: moviesSlideshow),
                      HorizontalListview(
                        movies: movies,
                        title: 'Playing now',
                        loadNextPage: () => ref
                            .read(nowPlayingMoviesProvider.notifier)
                            .loadNextPage(),
                      ),
                      HorizontalListview(
                        movies: popularMovies,
                        title: 'Popular',
                        loadNextPage: () => ref
                            .read(popularMoviesProvider.notifier)
                            .loadNextPage(),
                      ),
                      HorizontalListview(
                        movies: upcomingMovies,
                        title: 'Popular',
                        loadNextPage: () => ref
                            .read(upcomingMoviesProvider.notifier)
                            .loadNextPage(),
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';

class HomePage extends ConsumerStatefulWidget {
  static const name = 'home-screen';

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // final movies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);

    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(),
          Slideshow(movies: moviesSlideshow),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

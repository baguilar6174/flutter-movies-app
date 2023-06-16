import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter_movies_app/domain/domain.dart';
import 'package:flutter_movies_app/presentation/widgets/movies/movies.dart';

class MasonryListview extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MasonryListview({super.key, required this.movies, this.loadNextPage});

  @override
  State<MasonryListview> createState() => _MasonryListviewState();
}

class _MasonryListviewState extends State<MasonryListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 100) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 25),
                MoviePoster(movie: movie),
              ],
            );
          }
          return MoviePoster(movie: movie);
        },
      ),
    );
  }
}

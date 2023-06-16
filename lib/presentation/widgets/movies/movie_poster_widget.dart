import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_movies_app/domain/domain.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;

  const MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/home/0/movie/${movie.id}'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(movie.posterPath),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  static const name = 'movie-page';

  final String movieId;

  const MoviePage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('id: $movieId'),
      ),
    );
  }
}

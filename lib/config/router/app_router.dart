import 'package:go_router/go_router.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MoviePage.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MoviePage(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);

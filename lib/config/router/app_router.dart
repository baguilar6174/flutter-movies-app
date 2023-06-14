import 'package:go_router/go_router.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomePage(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(),
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
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        ),
      ],
    ),

    /* GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(
        childView: FavoritesView(),
      ),
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
    ), */
  ],
);

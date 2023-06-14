import 'package:flutter/material.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';
  final int pageIndex;

  const HomePage({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    CategoriesView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(index: pageIndex),
    );
  }
}

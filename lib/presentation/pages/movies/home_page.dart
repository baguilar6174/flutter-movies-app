import 'package:flutter/material.dart';

import 'package:flutter_movies_app/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';

  final Widget childView;

  const HomePage({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

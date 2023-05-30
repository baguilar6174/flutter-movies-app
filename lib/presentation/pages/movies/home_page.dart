import 'package:flutter/material.dart';

import 'package:flutter_movies_app/config/config.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-screen';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.movieDBApiKey),
      ),
    );
  }
}

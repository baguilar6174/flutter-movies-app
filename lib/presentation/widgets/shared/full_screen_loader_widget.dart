import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Wait a moment...'),
          SizedBox(height: 10),
          CircularProgressIndicator(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

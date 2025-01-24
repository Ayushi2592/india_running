import 'package:flutter/material.dart';

class TrendingEventsScreen extends StatelessWidget {
  const TrendingEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trending Events")),
      body: const Center(child: Text("Details about Trending Events")),
    );
  }
}
import 'package:flutter/material.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carousel Details")),
      body: const Center(child: Text("Details about Carousel Items")),
    );
  }
}
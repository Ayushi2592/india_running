import 'package:flutter/material.dart';

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificates',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,

      ),
      body: const Center(
        child: Text('No Certificates Found !!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Searching',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,

      ),
      body: const Center(
        child: Text('Hangout!!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

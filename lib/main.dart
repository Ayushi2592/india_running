import 'package:flutter/material.dart';
import 'package:india_running/screens/CarouselScreen.dart';
import 'package:india_running/screens/ProfileScreen.dart';
import 'package:india_running/screens/homescreen.dart';
import 'package:india_running/screens/searchscreen.dart';
import 'package:india_running/screens/trendingeventscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    routes: {
      '/profile': (context) => ProfileScreen(),
      '/carousel': (context) => CarouselScreen(),
      '/trending': (context) => TrendingEventsScreen(),
      '/search': (context) => SearchScreen(),
    },
  ));
}

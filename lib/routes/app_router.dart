import 'package:flutter/material.dart';
import 'package:india_running/features/home/presentation/screens/searchscreen.dart';
import 'package:india_running/features/home/presentation/screens/trendingeventscreen.dart';
import '../features/home/presentation/screens/carosuelscreen.dart';
import '../features/home/presentation/screens/homescreen.dart';
import '../features/home/presentation/screens/profilescreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/carousel':
        return MaterialPageRoute(builder: (_) => CarouselScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/trending':
        return MaterialPageRoute(builder: (_) => TrendingEventsScreen());
      case '/search':
        return MaterialPageRoute(builder: (_) => SearchScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

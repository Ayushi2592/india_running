import 'package:flutter/material.dart';
import 'package:india_running/screens/CarouselScreen.dart';
import 'package:india_running/screens/ProfileScreen.dart';
import 'package:india_running/screens/homescreen.dart';
import 'package:india_running/screens/homescreenstatenotifier.dart';
import 'package:india_running/screens/searchscreen.dart';
import 'package:india_running/screens/trendingeventscreen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeScreenStateNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/',  // Initial route
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => SearchScreen(),
        ),
        GoRoute(
          path: '/carousel',
          builder: (context, state) => CarouselScreen(),
        ),
        GoRoute(
          path: '/trending',
          builder: (context, state) => TrendingEventScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}
